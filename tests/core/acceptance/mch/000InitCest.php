<?php

class InitCest
{
    public function _before(AcceptanceTester $I)
    {
    }

    public function _after(AcceptanceTester $I)
    {
    }

    // tests
    public function testInit(AcceptanceTester $I)
    {
        $I->amOnRoute('admin%2Fapp%2Fentry', ['id' => 16]);
        $I->waitForText('哈哈哈');
    }
}