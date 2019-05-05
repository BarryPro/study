<!-- tree view 可以把外层div也合并过来 -->
<div id="order-trace-tree-view-div" style="display: none;">

    <table class="table table-bordered chain-base-info-table"
           style="margin-top: 15px">
        <thead>
        <tr>
            <th>order_token</th>
            <th>appkey</th>
            <th>phone</th>
            <th>user_id</th>
            <th>poi_id</th>
            <th>uuid</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="order_token"></td>
            <td class="appekey"></td>
            <td class="phone"></td>
            <td class="user_id"></td>
            <td class="poi_id"></td>
            <td class="uuid"></td>
        </tr>
        </tbody>
    </table>

    <div class="tree tree-scrolls">
    <ul class="order-trace-ul">

        <li value="node" id="node-li" style="display: none;">
            <a href="javascript:void(0)" class="node-plus node-li-a">
                <span class="node-name" style="font-weight: bold"></span>
                <span class="node-plus-tag">+</span>
                <pre class="node-base-info"
                     style="text-align: left; width: 230px;
                     overflow-x: hidden; white-space: pre-wrap"></pre>
            </a>
            <ul class="trace-ul" style="display: none;">

                <li id="trace-li" class="trace-li" style="display: none">
                    <a href="javascript:void(0)" class="trace-plus trace-li-a">
                        <span class="trace-name"></span>
                        <span class="trace-plus-tag">+</span>
                        <pre class="trace-base-info"
                             style="text-align: left; width: 230px;
                             overflow-x: hidden; white-space: pre-wrap"></pre>
                        <pre class="trace-error-msg"
                             style="display: none;text-align: left; width: 230px;
                             overflow-x: hidden; white-space: pre-wrap"></pre>
                    </a>
                    <ul class="flow-data-ul" style="display: none;">
                        <li class="in-li">
                            <a href="javascript:void(0)">
                                <span>参数</span>
                                <pre class="in-data-json"
                                     style="text-align: left; width: 230px;
                                     overflow-x: hidden; white-space: pre-wrap"></pre>
                            </a>
                        </li>
                        <li class="out-li">
                            <a href="javascript:void(0)">
                                <span>返回结果</span>
                                <pre class="out-data-json"
                                     style="text-align: left; width: 230px;
                                     overflow-x: hidden; white-space: pre-wrap"></pre>
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
        </li>

    </ul>
    </div>
</div>