<?php

require_once '../../../../../pangloss/tools/phprftlite-1.1.1/tests/Mocks/PHPUnit/Framework.php';
require_once dirname(__FILE__) . '/../../lib/PHPRtfLite.php';

// register PHPRtfLite class loader
PHPRtfLite::registerAutoloader();

class PHPRtfLite_StreamOutputMock extends PHPRtfLite_StreamOutput
{
    public $content = '';

    public function write($text)
    {
        $this->content .= $text;
    }
}