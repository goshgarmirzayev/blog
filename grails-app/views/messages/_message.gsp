<g:if test="${flash.message}">
    <center>
        <div class="alert alert-warning alert-dismissible fade show col-md-6 mx-auto" role="alert"
             style="margin-top:70px;">
            <h6>${flash?.message}</h6>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </center>
</g:if>