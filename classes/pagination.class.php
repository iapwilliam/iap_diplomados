<?php

class Pagination
{

    public $perpage;

    function __construct()
    {
        $this->perpage = 1;
    }

    function perpage($count, $href)
    {
        $output = '';
        if (! isset($_GET["page"]))
            $_GET["page"] = 1;
        if ($this->perpage != 0)
            $pages = ceil($count / $this->perpage);
        if ($pages > 1) {
            if ($_GET["page"] == 1)
                $output = $output . '<span class="disabled"><<</span><span class="disabled"><</span>';
            else
                $output = $output . '<a class="link" onclick="getresult(\'' . $href . (1) . '\')" ><<</a><a class="link" onclick="getresult(\'' . $href . ($_GET["page"] - 1) . '\')" ><</a>';

            if (($_GET["page"] - 3) > 0) {
                if ($_GET["page"] == 1)
                    $output = $output . '<span id=1 class="current">1</span>';
                else
                    $output = $output . '<a class="link" onclick="getresult(\'' . $href . '1\')" >1</a>';
            }
            if (($_GET["page"] - 3) > 1) {
                $output = $output . '...';
            }

            for ($i = ($_GET["page"] - 2); $i <= ($_GET["page"] + 2); $i ++) {
                if ($i < 1)
                    continue;
                if ($i > $pages)
                    break;
                if ($_GET["page"] == $i)
                    $output = $output . '<span id=' . $i . ' class="current">' . $i . '</span>';
                else
                    $output = $output . '<a class="link" onclick="getresult(\'' . $href . $i . '\')" >' . $i . '</a>';
            }

            if (($pages - ($_GET["page"] + 2)) > 1) {
                $output = $output . '...';
            }
            if (($pages - ($_GET["page"] + 2)) > 0) {
                if ($_GET["page"] == $pages)
                    $output = $output . '<span id=' . ($pages) . ' class="current">' . ($pages) . '</span>';
                else
                    $output = $output . '<a class="link" onclick="getresult(\'' . $href . ($pages) . '\')" >' . ($pages) . '</a>';
            }

            if ($_GET["page"] < $pages)
                $output = $output . '<a  class="link" onclick="getresult(\'' . $href . ($_GET["page"] + 1) . '\')" >></a><a  class="link" onclick="getresult(\'' . $href . ($pages) . '\')" >>></a>';

            else
                $output = $output . '<span class="disabled">></span><span class="disabled">>></span>';
            $output = $output . '<span id="loader-icon">
                <img src="LoaderIcon.gif" />
                </span>';
        }
        return $output;
    }
}
?>