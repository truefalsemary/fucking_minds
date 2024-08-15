#pragma once

#include <userver/storages/postgres/io/enum_types.hpp>
#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service{
enum class UserRole { kStudent, kTeacher, kAdmin };

std::string parseToString(const UserRole& user);
}
template <>
struct userver::storages::postgres::io::CppToUserPg<lms_service::UserRole> {
  static constexpr DBTypeName postgres_name = "lms_service_db_1";
  static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators =
      [](auto selector) {
        return selector()
            .Case("student", lms_service::UserType::kStudent)
            .Case("teacher", lms_service::UserType::kTeacher)
            .Case("admin", lms_service::UserType::kAdmin);
      };
};
