<?php


class AdminCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function testUserMe(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fuser%2Fme');
        $I->see('我的账户');
    }

    public function testUserIndex(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fuser%2Findex');
        $I->see('账户列表');
    }

    public function testUserEdit(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fuser%2Fedit');
        $I->see('新增子账户');
    }

    public function testUserRegister(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fuser%2Fregister');
        $I->see('注册审核');
    }

    public function testAppIndex(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fapp%2Findex');
        $I->see('小程序商城');
    }

    public function testAppRecycle(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fapp%2Frecycle');
        $I->see('回收站');
    }

    public function testAppOtherApp(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fapp%2Fother-app');
        $I->see('子账户的商城');
    }
}
