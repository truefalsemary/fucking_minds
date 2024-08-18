#pragma once

#include <userver/storages/postgres/io/enum_types.hpp>
#include <userver/storages/postgres/io/io_fwd.hpp>
#include <userver/utils/trivial_map.hpp>

namespace lms_service {
    enum class StatusCode { kNotSent, kSubmitted, kInReview, kReviewed, kCompleted };

    std::string parseToString(const StatusCode& status_code);
    StatusCode parseCodeFromString(const std::string& status_code);
}

template <>
struct userver::storages::postgres::io::CppToUserPg<lms_service::StatusCode>
{
    static constexpr DBTypeName postgres_name = "public.statuscode";
    static constexpr USERVER_NAMESPACE::utils::TrivialBiMap enumerators = 
        [](auto selector) {
            return selector ()
                .Case("not_sent", lms_service::StatusCode::kNotSent)
                .Case("submitted", lms_service::StatusCode::kSubmitted)
                .Case("in_review", lms_service::StatusCode::kInReview)
                .Case("reviewed", lms_service::StatusCode::kReviewed)
                .Case("completed", lms_service::StatusCode::kCompleted);
        };
};
