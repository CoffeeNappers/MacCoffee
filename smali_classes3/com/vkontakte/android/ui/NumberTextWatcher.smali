.class public Lcom/vkontakte/android/ui/NumberTextWatcher;
.super Ljava/lang/Object;
.source "NumberTextWatcher.java"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field private dfnd:Ljava/text/DecimalFormat;

.field private et:Landroid/widget/EditText;


# direct methods
.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 2
    .param p1, "et"    # Landroid/widget/EditText;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    new-instance v1, Ljava/text/DecimalFormat;

    invoke-direct {v1}, Ljava/text/DecimalFormat;-><init>()V

    iput-object v1, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    .line 23
    iget-object v1, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v1}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v0

    .line 25
    .local v0, "symbols":Ljava/text/DecimalFormatSymbols;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 26
    iget-object v1, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v1, v0}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 27
    iput-object p1, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    .line 28
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 9
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 32
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    .line 36
    :try_start_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v2

    .line 37
    .local v2, "inilen":I
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v7}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v7

    invoke-virtual {v7}, Ljava/text/DecimalFormatSymbols;->getGroupingSeparator()C

    move-result v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, ""

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 38
    .local v5, "v":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v6, v5}, Ljava/text/DecimalFormat;->parse(Ljava/lang/String;)Ljava/lang/Number;

    move-result-object v3

    .line 39
    .local v3, "n":Ljava/lang/Number;
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v0

    .line 41
    .local v0, "cp":I
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    iget-object v7, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->dfnd:Ljava/text/DecimalFormat;

    invoke-virtual {v7, v3}, Ljava/text/DecimalFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 42
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v1

    .line 43
    .local v1, "endlen":I
    sub-int v6, v1, v2

    add-int v4, v0, v6

    .line 44
    .local v4, "sel":I
    if-lez v4, :cond_0

    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v6

    invoke-interface {v6}, Landroid/text/Editable;->length()I

    move-result v6

    if-gt v4, v6, :cond_0

    .line 45
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6, v4}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    .line 55
    .end local v0    # "cp":I
    .end local v1    # "endlen":I
    .end local v2    # "inilen":I
    .end local v3    # "n":Ljava/lang/Number;
    .end local v4    # "sel":I
    .end local v5    # "v":Ljava/lang/String;
    :goto_0
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v6, p0}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 56
    return-void

    .line 47
    .restart local v0    # "cp":I
    .restart local v1    # "endlen":I
    .restart local v2    # "inilen":I
    .restart local v3    # "n":Ljava/lang/Number;
    .restart local v4    # "sel":I
    .restart local v5    # "v":Ljava/lang/String;
    :cond_0
    :try_start_1
    iget-object v6, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    iget-object v7, p0, Lcom/vkontakte/android/ui/NumberTextWatcher;->et:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-interface {v7}, Landroid/text/Editable;->length()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setSelection(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 49
    .end local v0    # "cp":I
    .end local v1    # "endlen":I
    .end local v2    # "inilen":I
    .end local v3    # "n":Ljava/lang/Number;
    .end local v4    # "sel":I
    .end local v5    # "v":Ljava/lang/String;
    :catch_0
    move-exception v6

    goto :goto_0

    .line 51
    :catch_1
    move-exception v6

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 59
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 64
    return-void
.end method
