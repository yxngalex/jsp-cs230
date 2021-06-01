package com.example.app.util;

import com.example.app.database.entity.Role;

public class Util {
    public static boolean hasRole(Iterable<Role> roles, String roleName) {
        for (Role role: roles) {
            if (role.getRole().equals(roleName)) {
                return true;
            }
        }
        return false;
    }

    public static boolean hasRole(Iterable<Role> roles, Integer roleId) {
        for (Role role: roles) {
            if (role.getIdRole().equals(roleId)) {
                return true;
            }
        }
        return false;
    }
}
