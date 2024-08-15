#pragma once
#include <userver/storages/postgres/io/enum_types.hpp>
#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service
{
enum class UserType { kAnonymous, kGeneral, kSuper };
std::string parseToString(const UserType& user);
UserType parseTypeFromString(const std::string& user_role);

}
template <>
struct userver::storages::postgres::io::CppToUserPg<lms_service::UserType> {
  static constexpr DBTypeName postgres_name = "lms_service_db_1";
  static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators =
      [](auto selector) {
        return selector()
            .Case("anonymous", lms_service::UserType::kAnonymous)
            .Case("general", lms_service::UserType::kGeneral)
            .Case("super", lms_service::UserType::kSuper);
      };
};
