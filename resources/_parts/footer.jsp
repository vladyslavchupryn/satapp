<%@page language="java" contentType="text/html; charset=utf8" pageEncoding="utf8" %>
<!-- Footer Wrapper -->
<div id="footer-wrapper">
    <div id="footer" class="container">
        <header>
            <h2>Консультации и прием заказов можно осуществить </h2>
        </header>
        <div class="row">
            <div class="6u">
                <section>
                    <form method="post" action="#">
                        <div class="row half">
                            <div class="6u">
                                <input name="name" placeholder="Имя" type="text" class="text" />
                            </div>
                            <div class="6u">
                                <input name="email" placeholder="Email" type="text" class="text" />
                            </div>
                        </div>
                        <div class="row half">
                            <div class="12u">
                                <textarea name="message" placeholder="Сообщение"></textarea>
                            </div>
                        </div>
                        <div class="row half">
                            <div class="12u">
                                <a href="#" class="button button-icon fa fa-envelope">Отправить письмо</a>
                            </div>
                        </div>
                    </form>
                </section>
            </div>
            <div class="6u">
                <section>
                    <div class="row">
                        <jsp:include page="_parts/article.jsp" >
                            <jsp:param name="pageCode" value="footer" />
                        </jsp:include>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
