.class public Lcom/vkontakte/android/fragments/SignupProfileFragment;
.super Lcom/vkontakte/android/fragments/VKFragment;
.source "SignupProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/SignupProfileFragment$TextWatcherAdapter;,
        Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;
    }
.end annotation


# static fields
.field private static final AVA_RESULT:I = 0x65


# instance fields
.field private bday:I

.field private bmonth:I

.field private byear:I

.field private doneFunc:Lcom/vkontakte/android/functions/VoidF0;

.field private firstName:Ljava/lang/CharSequence;

.field private gender:I

.field private lastName:Ljava/lang/CharSequence;

.field private mPhotoBottom:F

.field private mPhotoLeft:F

.field private mPhotoRight:F

.field private mPhotoTop:F

.field private photo:Ljava/lang/String;

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKFragment;-><init>()V

    .line 60
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$102(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->lastName:Ljava/lang/CharSequence;

    return-object p1
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    return p1
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    return p1
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # I

    .prologue
    .line 53
    iput p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    return p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->updateBDateText()V

    return-void
.end method

.method static synthetic access$1500(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->startTermsFragment(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 53
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->firstName:Ljava/lang/CharSequence;

    return-object p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->selectBirthDate()V

    return-void
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;
    .param p1, "x1"    # Landroid/net/Uri;

    .prologue
    .line 53
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoTop:F

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoRight:F

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoBottom:F

    return v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/SignupProfileFragment;)F
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 53
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoLeft:F

    return v0
.end method

.method private applyTermsHack(Landroid/view/View;)V
    .locals 11
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v7, 0x0

    .line 163
    const v6, 0x7f100540

    invoke-virtual {p1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 167
    .local v5, "terms":Landroid/widget/TextView;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v6

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f0806b3

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-virtual {v6, v8}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v1

    .line 168
    .local v1, "s":Landroid/text/Spannable;
    invoke-interface {v1}, Landroid/text/Spannable;->length()I

    move-result v6

    const-class v8, Landroid/text/style/URLSpan;

    invoke-interface {v1, v7, v6, v8}, Landroid/text/Spannable;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Landroid/text/style/URLSpan;

    .line 169
    .local v3, "spans":[Landroid/text/style/URLSpan;
    array-length v8, v3

    move v6, v7

    :goto_0
    if-ge v6, v8, :cond_0

    aget-object v2, v3, v6

    .line 170
    .local v2, "span":Landroid/text/style/URLSpan;
    invoke-interface {v1, v2}, Landroid/text/Spannable;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    .line 171
    .local v4, "start":I
    invoke-interface {v1, v2}, Landroid/text/Spannable;->getSpanEnd(Ljava/lang/Object;)I

    move-result v0

    .line 172
    .local v0, "end":I
    invoke-interface {v1, v2}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    .line 173
    new-instance v9, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;

    invoke-virtual {v2}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, p0, v10}, Lcom/vkontakte/android/fragments/SignupProfileFragment$LinkButtonSpan;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/String;)V

    invoke-interface {v1, v9, v4, v0, v7}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 169
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 175
    .end local v0    # "end":I
    .end local v2    # "span":Landroid/text/style/URLSpan;
    .end local v4    # "start":I
    :cond_0
    invoke-virtual {v5, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 176
    return-void
.end method

.method private getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;
    .locals 8
    .param p1, "contentUri"    # Landroid/net/Uri;

    .prologue
    const/4 v3, 0x0

    .line 192
    invoke-virtual {p1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 199
    :goto_0
    return-object v0

    .line 195
    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string/jumbo v1, "_data"

    aput-object v1, v2, v0

    .line 196
    .local v2, "proj":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    move-object v1, p1

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 197
    .local v7, "cursor":Landroid/database/Cursor;
    const-string/jumbo v0, "_data"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    .line 198
    .local v6, "column_index":I
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 199
    invoke-interface {v7, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method private selectBirthDate()V
    .locals 7

    .prologue
    const/4 v5, 0x1

    .line 412
    new-instance v0, Landroid/app/DatePickerDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    iget v3, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    const/16 v4, 0x76d

    if-lt v3, v4, :cond_1

    iget v3, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    .line 420
    :goto_0
    iget v4, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    if-lez v4, :cond_2

    iget v4, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    add-int/lit8 v4, v4, -0x1

    :goto_1
    iget v6, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    if-lez v6, :cond_0

    iget v5, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    :cond_0
    invoke-direct/range {v0 .. v5}, Landroid/app/DatePickerDialog;-><init>(Landroid/content/Context;Landroid/app/DatePickerDialog$OnDateSetListener;III)V

    .line 421
    .local v0, "dpd":Landroid/app/DatePickerDialog;
    invoke-virtual {v0}, Landroid/app/DatePickerDialog;->show()V

    .line 422
    return-void

    .line 420
    .end local v0    # "dpd":Landroid/app/DatePickerDialog;
    :cond_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v3

    invoke-virtual {v3, v5}, Ljava/util/Calendar;->get(I)I

    move-result v3

    add-int/lit8 v3, v3, -0xe

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1
.end method

.method private startTermsFragment(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 179
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 180
    return-void
.end method

.method private updateBDateText()V
    .locals 4

    .prologue
    .line 425
    const-string/jumbo v0, ""

    .line 426
    .local v0, "date":Ljava/lang/String;
    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    if-lez v1, :cond_0

    .line 427
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0016

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 428
    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    if-lez v1, :cond_0

    .line 429
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 432
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v2, 0x7f1004df

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 433
    return-void
.end method

.method private updatePhoto()V
    .locals 2

    .prologue
    .line 224
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$4;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 353
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 354
    return-void
.end method


# virtual methods
.method public getBDate()Ljava/lang/String;
    .locals 2

    .prologue
    .line 380
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    if-nez v0, :cond_1

    .line 381
    :cond_0
    const-string/jumbo v0, ""

    .line 384
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bday:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->bmonth:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->byear:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getFirstName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 363
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->firstName:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->firstName:Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getGender()I
    .locals 1

    .prologue
    .line 372
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    return v0
.end method

.method public getLastName()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->lastName:Ljava/lang/CharSequence;

    if-nez v0, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->lastName:Ljava/lang/CharSequence;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public getPhoto()Ljava/lang/String;
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    return-object v0
.end method

.method public getPhotoBottom()F
    .locals 1

    .prologue
    .line 475
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoBottom:F

    return v0
.end method

.method public getPhotoLeft()F
    .locals 1

    .prologue
    .line 463
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoLeft:F

    return v0
.end method

.method public getPhotoRight()F
    .locals 1

    .prologue
    .line 471
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoRight:F

    return v0
.end method

.method public getPhotoTop()F
    .locals 1

    .prologue
    .line 467
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoTop:F

    return v0
.end method

.method public isFilled()I
    .locals 3

    .prologue
    const/4 v2, 0x2

    const/4 v0, -0x1

    .line 388
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    if-nez v1, :cond_0

    .line 407
    :goto_0
    return v0

    .line 392
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getFirstName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v1, v2, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getLastName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v1, v2, :cond_2

    .line 393
    :cond_1
    const v1, 0x7f0806a4

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    goto :goto_0

    .line 397
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getGender()I

    move-result v1

    if-nez v1, :cond_3

    .line 398
    const v1, 0x7f0806a3

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    goto :goto_0

    .line 402
    :cond_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getBDate()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 403
    const v1, 0x7f080693

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    goto :goto_0

    .line 407
    :cond_4
    const/4 v0, 0x1

    goto :goto_0
.end method

.method synthetic lambda$onCreateView$0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    if-eqz v0, :cond_0

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 116
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method synthetic lambda$onCreateView$1(Landroid/widget/TextView;)V
    .locals 3
    .param p1, "textViewFirstName"    # Landroid/widget/TextView;

    .prologue
    .line 146
    invoke-virtual {p1}, Landroid/widget/TextView;->requestFocus()Z

    .line 147
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 148
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v2, 0x7f100538

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 149
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const v4, 0x7f10053b

    const/16 v3, 0x65

    const/4 v2, 0x0

    .line 203
    if-ne p1, v3, :cond_1

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 204
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 205
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 207
    :cond_0
    const-string/jumbo v0, "file"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    .line 208
    const-string/jumbo v0, "cropLeft"

    invoke-virtual {p3, v0, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoLeft:F

    .line 209
    const-string/jumbo v0, "cropTop"

    invoke-virtual {p3, v0, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoTop:F

    .line 210
    const-string/jumbo v0, "cropRight"

    invoke-virtual {p3, v0, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoRight:F

    .line 211
    const-string/jumbo v0, "cropBottom"

    invoke-virtual {p3, v0, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->mPhotoBottom:F

    .line 212
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->updatePhoto()V

    .line 214
    :cond_1
    if-ne p1, v3, :cond_2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_2

    .line 215
    iput-object v5, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    .line 216
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v1, 0x7f10053a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v5}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 221
    :cond_2
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    .line 76
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    .line 96
    :goto_0
    return-void

    .line 78
    :sswitch_0
    const/4 v2, 0x2

    iput v2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    goto :goto_0

    .line 81
    :sswitch_1
    iput v4, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    goto :goto_0

    .line 84
    :sswitch_2
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 85
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "allow_album"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 86
    const-string/jumbo v2, "limit"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 87
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 88
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 89
    const v2, 0x7f08019c

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 91
    :cond_0
    const-string/jumbo v2, "custom"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 92
    const-string/jumbo v2, "force_thumb"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 93
    const/16 v2, 0x65

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 76
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1004dd -> :sswitch_0
        0x7f1004de -> :sswitch_1
        0x7f100539 -> :sswitch_2
    .end sparse-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 12
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 100
    const v7, 0x7f0301fc

    const/4 v8, 0x0

    invoke-virtual {p1, v7, p2, v8}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v7

    iput-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    .line 102
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f100088

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    .line 103
    .local v6, "topBlock":Landroid/view/View;
    invoke-virtual {v6}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .local v1, "pl":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    .local v3, "pt":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .local v2, "pr":I
    invoke-virtual {v6}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 104
    .local v0, "pb":I
    new-instance v8, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const/4 v10, -0x1

    const/high16 v7, 0x40000000    # 2.0f

    invoke-static {v7}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v7

    int-to-float v11, v7

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->isTablet:Z

    if-nez v7, :cond_2

    const/4 v7, 0x1

    :goto_0
    invoke-direct {v8, v9, v10, v11, v7}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    invoke-virtual {v6, v8}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 105
    invoke-virtual {v6, v1, v3, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 107
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f1004dd

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f1004de

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f100539

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f10053d

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/EditText;

    .line 112
    .local v5, "textViewLastName":Landroid/widget/EditText;
    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupProfileFragment;)Landroid/widget/TextView$OnEditorActionListener;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 118
    new-instance v7, Lcom/vkontakte/android/fragments/SignupProfileFragment$1;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$1;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    invoke-virtual {v5, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 125
    iget v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    if-lez v7, :cond_0

    .line 126
    iget-object v8, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    iget v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->gender:I

    const/4 v9, 0x1

    if-ne v7, v9, :cond_3

    const v7, 0x7f1004de

    :goto_1
    invoke-virtual {v8, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Landroid/view/View;->setSelected(Z)V

    .line 129
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->updateBDateText()V

    .line 131
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->photo:Ljava/lang/String;

    if-eqz v7, :cond_1

    .line 132
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f10053b

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    const/16 v8, 0x8

    invoke-virtual {v7, v8}, Landroid/view/View;->setVisibility(I)V

    .line 133
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->updatePhoto()V

    .line 135
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->applyTermsHack(Landroid/view/View;)V

    .line 137
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f10053c

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 138
    .local v4, "textViewFirstName":Landroid/widget/TextView;
    new-instance v7, Lcom/vkontakte/android/fragments/SignupProfileFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$2;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 145
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    invoke-static {p0, v4}, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/widget/TextView;)Ljava/lang/Runnable;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 152
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    const v8, 0x7f1004df

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/fragments/SignupProfileFragment$3;

    invoke-direct {v8, p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$3;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    invoke-virtual {v7, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 159
    iget-object v7, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    return-object v7

    .line 104
    .end local v4    # "textViewFirstName":Landroid/widget/TextView;
    .end local v5    # "textViewLastName":Landroid/widget/EditText;
    :cond_2
    const/4 v7, 0x0

    goto/16 :goto_0

    .line 126
    .restart local v5    # "textViewLastName":Landroid/widget/EditText;
    :cond_3
    const v7, 0x7f1004dd

    goto :goto_1
.end method

.method public onDestroyView()V
    .locals 2

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 184
    const-string/jumbo v0, "vk"

    const-string/jumbo v1, "Clear focus"

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    .line 187
    :cond_0
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKFragment;->onDestroyView()V

    .line 188
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->view:Landroid/view/View;

    .line 189
    return-void
.end method

.method public setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V
    .locals 0
    .param p1, "doneFunc"    # Lcom/vkontakte/android/functions/VoidF0;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    .line 72
    return-void
.end method
