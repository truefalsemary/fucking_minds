#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service
{
enum class UserType { kAnonymous, kGeneral, kSuper };

template <>
struct userver::storages::postgres::io::CppToUserPg<UserType> {
  static constexpr DBTypeName postgres_name = "postgres-db-1";
  static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators =
      [](auto selector) {
        return selector()
            .Case("anonymous", UserType::kAnonymous)
            .Case("general", UserType::kGeneral)
            .Case("super", UserType::kSuper)
      };
};

}