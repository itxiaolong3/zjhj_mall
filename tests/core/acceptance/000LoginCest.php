<?php


class LoginCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function testLogin(AcceptanceTester $I)
    {
        $I->amOnRoute('admin/passport/login');
        $I->see('禾匠');
        $I->fillField('#app > form > div > input:nth-child(2)', 'admin');
        $I->fillField('#app > form > div > input:nth-child(3)', '123456');
        $I->fillField('#app > form > div > div > div > input', 'test');
        $I->clickWithLeftButton('#app > form > div > button');
        $I->waitForText('登录成功');
    }
}
