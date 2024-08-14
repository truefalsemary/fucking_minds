#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service {
enum class UserType { kStudent, kTeacher, kAdmin };

template <>
struct userver::storages::postgres::io::CppToUserPg<UserType> {
  static constexpr DBTypeName postgres_name = "postgres-db-1";
  static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators =
      [](auto selector) {
        return selector()
            .Case("student", UserType::kStudent)
            .Case("teacher", UserType::kTeacher)
            .Case("admin", UserType::kAdmin)
      };
};

}  // namespace lms_service