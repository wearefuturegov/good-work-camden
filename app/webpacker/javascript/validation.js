/**
 * TODO move this out of here
errors = [{errorText: "The date your passport was issued must be in the past", errorId: "passport-issued-error"}]
*/
window.errorSummaryTemplate = function(errors) {

    let errorsList = '';
    errors.forEach(errors => {
        errorsList += `<li><a href="#${errors.errorId}">${errors.errorText}</a></li>`
    });

    return `<div class="govuk-error-summary" aria-labelledby="error-summary-title" role="alert" tabindex="-1" data-module="govuk-error-summary">
                <h2 class="govuk-error-summary__title" id="error-summary-title">
                There is a problem
                </h2>
                <div class="govuk-error-summary__body">
                <ul class="govuk-list govuk-error-summary__list">
                    ${errorsList}
                </ul>
                </div>
            </div>`;
};

window.setErroredState = function(id) {
    var element = document.getElementById(`form-${id}`);
    element.classList.add('govuk-form-group--error');
    element.querySelector('.govuk-input').classList.add('govuk-input--error');
    element.querySelector('.govuk-error-message').classList.remove('start-hidden');
};

window.hasValue = function(id) {
    var val = '';
    val = document.getElementById(id).value;
    return val;
};

