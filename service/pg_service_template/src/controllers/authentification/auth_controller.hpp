#pragma once

#include "../../models/auth/token_model.hpp"

namespace lms_service {
    class AuthController {
        std::string GetUserIdByToken(const lms_service::Token& token);
    };
}