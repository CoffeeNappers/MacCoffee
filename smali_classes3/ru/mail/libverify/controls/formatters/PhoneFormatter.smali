.class public abstract Lru/mail/libverify/controls/formatters/PhoneFormatter;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;,
        Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;,
        Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;
    }
.end annotation


# static fields
.field private static final BLOCK_PHONE_NUMBER_ENTER_AFTER_LENGTH:I = 0x14

.field private static final CLEAR_PREVIOUS_TEXT_TIMEOUT:I = 0x12c

.field private static final MAX_CHECK_PHONE_NUMBER_WAIT:I = 0x2710

.field private static final MAX_PHONE_NUMBER_LENGTH:I = 0xf

.field private static final MIN_PHONE_NUMBER_LENGTH:I = 0x3


# instance fields
.field private final clearTextRunnable:Ljava/lang/Runnable;

.field private formatter:Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;

.field private lastTextAction:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

.field private final phoneCheckListener:Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;

.field private phoneCheckService:Ljava/lang/String;

.field protected final phoneNumber:Landroid/widget/EditText;

.field private phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

.field private processingNumber:Z

.field private final textWatcher:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

.field private final unblockRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;Ljava/lang/String;Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;)V
    .locals 3
    .param p1    # Landroid/widget/EditText;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->processingNumber:Z

    sget-object v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->UNKNOWN:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->lastTextAction:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

    invoke-direct {v0, p0, v2}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$1;)V

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->textWatcher:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;

    invoke-direct {v0, p0, v2}, Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$1;)V

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneCheckListener:Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$1;

    invoke-direct {v0, p0}, Lru/mail/libverify/controls/formatters/PhoneFormatter$1;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->clearTextRunnable:Ljava/lang/Runnable;

    new-instance v0, Lru/mail/libverify/controls/formatters/PhoneFormatter$2;

    invoke-direct {v0, p0}, Lru/mail/libverify/controls/formatters/PhoneFormatter$2;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->unblockRunnable:Ljava/lang/Runnable;

    iput-boolean v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->processingNumber:Z

    iput-object p1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-static {}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getInstance()Lcom/google/i18n/phonenumbers/PhoneNumberUtil;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->getAsYouTypeFormatter(Ljava/lang/String;)Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->formatter:Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/EditText;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setSelection(II)V

    iput-object p2, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneCheckService:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    return-void
.end method

.method static synthetic access$200(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getPhoneWithCode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lru/mail/libverify/controls/formatters/PhoneFormatter;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->clearTextRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400(Lru/mail/libverify/controls/formatters/PhoneFormatter;)Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->unblockRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$500(Lru/mail/libverify/controls/formatters/PhoneFormatter;)Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->lastTextAction:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    return-object v0
.end method

.method static synthetic access$502(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;)Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->lastTextAction:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    return-object p1
.end method

.method static synthetic access$600(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getFormattedPhoneNumber(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lru/mail/libverify/controls/formatters/PhoneFormatter;)Z
    .locals 1

    iget-boolean v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->processingNumber:Z

    return v0
.end method

.method static synthetic access$702(Lru/mail/libverify/controls/formatters/PhoneFormatter;Z)Z
    .locals 0

    iput-boolean p1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->processingNumber:Z

    return p1
.end method

.method static synthetic access$800(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->checkPhoneNumber(Ljava/lang/String;)V

    return-void
.end method

.method private checkPhoneNumber(Ljava/lang/String;)V
    .locals 4

    invoke-virtual {p0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneCheckRequired()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumberCheckSession:Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneCheckService:Ljava/lang/String;

    const/4 v2, 0x1

    iget-object v3, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneCheckListener:Lru/mail/libverify/controls/formatters/PhoneFormatter$PhoneCheckListenerImpl;

    invoke-virtual {v0, v1, p1, v2, v3}, Lru/mail/libverify/api/VerificationApi$PhoneNumberCheckSession;->checkPhoneNumber(Ljava/lang/String;Ljava/lang/String;ZLru/mail/libverify/api/VerificationApi$PhoneCheckListener;)V

    sget-object v0, Lru/mail/libverify/controls/Utils;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->unblockRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    sget-object v0, Lru/mail/libverify/controls/Utils;->uiHandler:Landroid/os/Handler;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->unblockRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method private getFormattedPhoneNumber(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 6

    const-string/jumbo v1, ""

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getPhoneWithCode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x0

    move v5, v0

    move-object v0, v1

    move v1, v5

    :goto_0
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v1, v3, :cond_2

    invoke-interface {v2, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-nez v4, :cond_0

    const/16 v4, 0x2b

    if-ne v3, v4, :cond_1

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->formatter:Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;

    invoke-virtual {v0, v3}, Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;->inputDigit(C)Ljava/lang/String;

    move-result-object v0

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getCountryCodeValue()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->formatter:Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;

    invoke-virtual {v1}, Lcom/google/i18n/phonenumbers/AsYouTypeFormatter;->clear()V

    return-object v0
.end method

.method private getPhoneWithCode(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "+"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getCountryCodeValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public attach()V
    .locals 4

    const/4 v3, 0x0

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->length()I

    move-result v1

    iget-object v2, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->length()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/EditText;->setSelection(II)V

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->textWatcher:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1, v3, v3, v3}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->onTextChanged(Ljava/lang/CharSequence;III)V

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->textWatcher:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public detach()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->textWatcher:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method protected abstract getCountryCodeValue()Ljava/lang/String;
.end method

.method protected abstract isFixedLineNumberBlockEnabled()Z
.end method

.method protected abstract isModifyPhoneNumberBlockEnabled()Z
.end method

.method protected abstract onPhoneInfoChanged(Ljava/lang/String;)V
.end method

.method protected abstract onPhoneInfoChanged(Ljava/lang/String;ZZ)V
.end method

.method protected abstract onPhoneInfoChanged(ZZ)V
.end method

.method protected onTextChanged()V
    .locals 0

    return-void
.end method

.method protected abstract phoneCheckRequired()Z
.end method

.method protected abstract setCountryCodeValue(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method protected update()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getPhoneWithCode(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->checkPhoneNumber(Ljava/lang/String;)V

    return-void
.end method
