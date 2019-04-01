# Hejiang Mall - Testing Environment

This is a test suite for `Hejiang Mall Application`. Before using it, remember to install all requirements first.

## Usage

1. Install requirements.

    ```bash
    composer install
    ```

1. Configure `acceptance.suite.yml` in `./core`. There's an example works for me:

    ```yml
    # Codeception Test Suite Configuration
    #
    # Suite for acceptance tests.
    # Perform tests in browser using the WebDriver or PhpBrowser.
    # If you need both WebDriver and PHPBrowser tests - create a separate suite.

    actor: AcceptanceTester
    modules:
        enabled:
            - WebDriver:
                url: 'http://we7.gg/core/web/'
                window_size: false
                port: 9515
                browser: chrome
                clear_cookies: false
            - \Helper\Acceptance
    ```

2. Download `ChromeDriver`, then run.

    Because of some reason, you cannot download it from google-apis or using `brew cask install chromedriver`.

    So I put them into `企业微信/文件盘/ChromeDriver`, included `mac` / `linux64` / `win32` versions.

    After unpacking, execute this command to launch `ChromeDriver` (Only unix-like system):

    ```bash
    ./chromedriver --url-base=/wd/hub
    ```

    For Windows, please use `git bash` or `cygwin`.

3. Run all test cases.

    ```bash
    vendor/bin/codecept run
    ```

## References

- <https://codeception.com/docs/03-AcceptanceTests>
- <https://codeception.com/docs/modules/WebDriver#ChromeDriver>
- <https://codeception.com/docs/modules/PhpBrowser>