package com.facebook;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
/* loaded from: classes.dex */
public class FacebookGraphResponseException extends FacebookException {
    private final GraphResponse graphResponse;

    public FacebookGraphResponseException(GraphResponse graphResponse, String errorMessage) {
        super(errorMessage);
        this.graphResponse = graphResponse;
    }

    public final GraphResponse getGraphResponse() {
        return this.graphResponse;
    }

    @Override // com.facebook.FacebookException, java.lang.Throwable
    public final String toString() {
        FacebookRequestError requestError = this.graphResponse != null ? this.graphResponse.getError() : null;
        StringBuilder errorStringBuilder = new StringBuilder().append("{FacebookGraphResponseException: ");
        String message = getMessage();
        if (message != null) {
            errorStringBuilder.append(message);
            errorStringBuilder.append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        }
        if (requestError != null) {
            errorStringBuilder.append("httpResponseCode: ").append(requestError.getRequestStatusCode()).append(", facebookErrorCode: ").append(requestError.getErrorCode()).append(", facebookErrorType: ").append(requestError.getErrorType()).append(", message: ").append(requestError.getErrorMessage()).append("}");
        }
        return errorStringBuilder.toString();
    }
}
