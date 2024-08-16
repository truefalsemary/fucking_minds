#pragma once

#include <userver/storages/postgres/io/enum_types.hpp>
#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service
{
enum class UserRole { kStudent, kTeacher, kAdmin };

std::string parseToString(const UserRole& user_role);
UserRole parseRoleFromString(const std::string& user_role);
}

template <>
struct userver::storages::postgres::io::CppToUserPg<lms_service::UserRole> 
{
  static constexpr DBTypeName postgres_name = "public.userrole";
  static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators =
      [](auto selector) {
        return selector()
            .Case("student", lms_service::UserRole::kStudent)
            .Case("teacher", lms_service::UserRole::kTeacher)
            .Case("admin", lms_service::UserRole::kAdmin);
      };
};
