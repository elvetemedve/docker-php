#!/bin/bash

function install_pdo_pgsql()
{
    _pdo_pgsql_deps_runtime

    if ! has_extension pdo_pgsql; then
        compile_pdo_pgsql
    fi
    docker-php-ext-enable pdo_pgsql
}

function compile_pdo_pgsql()
{
    _pdo_pgsql_deps_build

    docker-php-ext-install pdo_pgsql

    _pdo_pgsql_clean
}

function _pdo_pgsql_deps_runtime()
{
    install libpq5
}

function _pdo_pgsql_deps_build()
{
    install libpq-dev
}

function _pdo_pgsql_clean()
{
    remove libpq-dev
}
