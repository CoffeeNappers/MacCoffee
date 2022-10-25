.class Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/controls/formatters/PhoneFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TextWatcherImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;


# direct methods
.method private constructor <init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;-><init>(Lru/mail/libverify/controls/formatters/PhoneFormatter;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 7

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-virtual {v0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->onTextChanged()V

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-static {v0}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$700(Lru/mail/libverify/controls/formatters/PhoneFormatter;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-static {v0, v1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$702(Lru/mail/libverify/controls/formatters/PhoneFormatter;Z)Z

    if-le p3, p4, :cond_4

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    sget-object v3, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->REMOVE:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    invoke-static {v0, v3}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$502(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;)Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    :goto_0
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v0, v0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ne v0, v3, :cond_5

    move v0, v1

    :goto_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-virtual {v4}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->getCountryCodeValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/google/i18n/phonenumbers/PhoneNumberUtil;->normalizeDigitsOnly(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0xf

    if-lt v3, v4, :cond_6

    move v3, v1

    :goto_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    const/4 v6, 0x3

    if-lt v4, v6, :cond_7

    move v4, v1

    :goto_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v6, 0x14

    if-le v5, v6, :cond_8

    :goto_4
    if-eqz v1, :cond_0

    if-lez p4, :cond_0

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v1, v1, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    add-int v5, p2, p4

    invoke-interface {v1, p2, v5}, Landroid/text/Editable;->delete(II)Landroid/text/Editable;

    :cond_0
    if-eqz v4, :cond_9

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-static {v1, p1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$600(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    if-nez v0, :cond_1

    if-eqz v3, :cond_2

    :cond_1
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v0, v0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->clear()V

    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v0, v0, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->append(Ljava/lang/CharSequence;)V

    :cond_2
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v1, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v3, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    iget-object v3, v3, Lru/mail/libverify/controls/formatters/PhoneFormatter;->phoneNumber:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-static {v1, v3}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$200(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$800(Lru/mail/libverify/controls/formatters/PhoneFormatter;Ljava/lang/String;)V

    :goto_5
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    invoke-static {v0, v2}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$702(Lru/mail/libverify/controls/formatters/PhoneFormatter;Z)Z

    :cond_3
    return-void

    :cond_4
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    sget-object v3, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;->ADD:Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    invoke-static {v0, v3}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->access$502(Lru/mail/libverify/controls/formatters/PhoneFormatter;Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;)Lru/mail/libverify/controls/formatters/PhoneFormatter$TextAction;

    goto/16 :goto_0

    :cond_5
    move v0, v2

    goto/16 :goto_1

    :cond_6
    move v3, v2

    goto :goto_2

    :cond_7
    move v4, v2

    goto :goto_3

    :cond_8
    move v1, v2

    goto :goto_4

    :cond_9
    iget-object v0, p0, Lru/mail/libverify/controls/formatters/PhoneFormatter$TextWatcherImpl;->this$0:Lru/mail/libverify/controls/formatters/PhoneFormatter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lru/mail/libverify/controls/formatters/PhoneFormatter;->onPhoneInfoChanged(Ljava/lang/String;ZZ)V

    goto :goto_5
.end method
