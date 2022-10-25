.class public abstract Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;
.super Lru/mail/libverify/controls/formatters/PhoneFormatter;


# instance fields
.field protected final countryCode:Landroid/widget/TextView;

.field protected final phoneInfo:Landroid/widget/TextView;

.field private phoneNumberValid:Z


# direct methods
.method public constructor <init>(Landroid/widget/TextView;Landroid/widget/EditText;Landroid/widget/TextView;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;)V
    .locals 2
    .param p1    # Landroid/widget/TextView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/widget/TextView;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p2, p4, p5}, Lru/mail/libverify/controls/formatters/PhoneFormatter;-><init>(Landroid/widget/EditText;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;)V

    iput-object p1, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    iput-object p3, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneInfo:Landroid/widget/TextView;

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    new-instance v1, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter$1;-><init>(Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method private updateDoneButton()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneNumberValid:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p0, v0}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->onButtonStateChanged(Z)V

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected getCountryCodeValue()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected isFixedLineNumberBlockEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected isModifyPhoneNumberBlockEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected abstract onButtonStateChanged(Z)V
.end method

.method protected onPhoneInfoChanged(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected onPhoneInfoChanged(Ljava/lang/String;ZZ)V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneInfo:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0, p2, p3}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->onPhoneInfoChanged(ZZ)V

    return-void
.end method

.method protected onPhoneInfoChanged(ZZ)V
    .locals 0

    iput-boolean p1, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneNumberValid:Z

    invoke-direct {p0}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->updateDoneButton()V

    invoke-virtual {p0, p2}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->onWarningStateChanged(Z)V

    return-void
.end method

.method protected onTextChanged()V
    .locals 0

    invoke-direct {p0}, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->updateDoneButton()V

    return-void
.end method

.method protected abstract onWarningStateChanged(Z)V
.end method

.method protected phoneCheckRequired()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected setCountryCodeValue(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method

.method public setPhoneNumberWithCode(Ljava/lang/String;)V
    .locals 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    :goto_0
    return-void

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/google/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->parse(Ljava/lang/String;Ljava/lang/String;)Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->countryCode:Landroid/widget/TextView;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "+%d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;->getCountryCode()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneInfoSupportFormatter;->phoneNumber:Landroid/widget/EditText;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string/jumbo v3, "%d"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v0}, Lcom/google/i18n/phonenumbers/Phonenumber$PhoneNumber;->getNationalNumber()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V
    :try_end_0
    .catch Lcom/google/i18n/phonenumbers/NumberParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_0
.end method
