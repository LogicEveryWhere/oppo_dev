<?php
 
final class Smses extends SmsGate {
 
    public function send() {
        $number_sms = 1;
         
        $phones = $this->truncate($this->encode($this->to));        
             
        if ($this->copy) 
        {
            $phones.= ','.$this->copy;
        }
         
        $data = 'http://api.smses.ru/api?action=send_sms&' . "login=".$this->encode($this->username)."&password=".$this->encode($this->password)."&phones=".$phones."&sender=".$this->truncate($this->encode($this->from))."&text=".$this->encode($this->message);
 
 
        $result = $this->process($data);
 
        return $result;
    }
 
    private function process($data) 
    {
        static $count = 0;
        if ($count++) sleep(1);
        $content = file_get_contents($data);                      
        return $content;
    }
 
    private function encode($string) 
    {
        $string = urlencode($string);
        return $string;
    }
 
    private function truncate($string) {
        if (preg_match('/[^0-9]/', $string)) {
            $string = $this->utf8_truncate($string, 11, '');
        } else {
            $string = substr($string, 0, 15);
        }
 
        return $string;
    }
 
    private function utf8_truncate($string, $length = 20, $etc = '..', $break_words = false, $middle = false) {
        if ($length == 0) {
            return '';
        }
 
        if (utf8_strlen($string) > $length) {
            $length -= min($length, strlen($etc));
            if (!$break_words && !$middle) {
                $string = preg_replace('/\s+?(\S+)?$/', '', utf8_substr($string, 0, $length+1));
            }
            if(!$middle) {
                return utf8_substr($string, 0, $length) . $etc;
            } else {
                return utf8_substr($string, 0, $length/2) . $etc . utf8_substr($string, -$length/2);
            }
        } else {
            return $string;
        }
    }
     
}
?>