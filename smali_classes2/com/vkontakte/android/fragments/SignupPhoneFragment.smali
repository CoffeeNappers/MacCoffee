.class public Lcom/vkontakte/android/fragments/SignupPhoneFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "SignupPhoneFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;,
        Lcom/vkontakte/android/fragments/SignupPhoneFragment$CountriesAdapter;,
        Lcom/vkontakte/android/fragments/SignupPhoneFragment$Builder;
    }
.end annotation


# static fields
.field public static final KEY_PHONE:Ljava/lang/String; = "phone"

.field private static final KEY_SHOW_TOOLBAR:Ljava/lang/String; = "show_toolbar"


# instance fields
.field private canadianPrefixes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private countries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;",
            ">;"
        }
    .end annotation
.end field

.field private doneFunc:Lcom/vkontakte/android/functions/VoidF0;

.field private dontUpdateField:Z

.field private ignoreSelCallback:Z

.field private selectedCountry:I

.field private showForgot:Z

.field private view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 78
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    .line 59
    iput v2, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    .line 60
    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->ignoreSelCallback:Z

    iput-boolean v2, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->dontUpdateField:Z

    .line 75
    const/16 v0, 0x20

    new-array v0, v0, [Ljava/lang/String;

    const-string/jumbo v1, "403"

    aput-object v1, v0, v2

    const/4 v1, 0x1

    const-string/jumbo v2, "587"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string/jumbo v2, "780"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string/jumbo v2, "250"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string/jumbo v2, "604"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string/jumbo v2, "778"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string/jumbo v2, "418"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string/jumbo v2, "438"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string/jumbo v2, "450"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string/jumbo v2, "514"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string/jumbo v2, "579"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string/jumbo v2, "581"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string/jumbo v2, "819"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string/jumbo v2, "204"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string/jumbo v2, "902"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string/jumbo v2, "867"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string/jumbo v2, "506"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string/jumbo v2, "709"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string/jumbo v2, "226"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string/jumbo v2, "249"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string/jumbo v2, "289"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string/jumbo v2, "343"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string/jumbo v2, "416"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string/jumbo v2, "519"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string/jumbo v2, "613"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string/jumbo v2, "647"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string/jumbo v2, "705"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string/jumbo v2, "807"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string/jumbo v2, "905"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string/jumbo v2, "902"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string/jumbo v2, "306"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string/jumbo v2, "867"

    aput-object v2, v0, v1

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->canadianPrefixes:Ljava/util/List;

    .line 80
    return-void
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->canadianPrefixes:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Lcom/vkontakte/android/functions/VoidF0;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setResultAndFinish(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/SignupPhoneFragment;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # I

    .prologue
    .line 44
    iput p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->ignoreSelCallback:Z

    return v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->ignoreSelCallback:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/SignupPhoneFragment;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # I

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setCountry(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->findCountryByCode(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->findCountryByIso(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;
    .param p1, "x1"    # Z

    .prologue
    .line 44
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->dontUpdateField:Z

    return p1
.end method

.method private findCountryByCode(Ljava/lang/String;)I
    .locals 7
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    .line 371
    const/4 v2, 0x0

    .line 372
    .local v2, "i":I
    const/4 v1, 0x0

    .line 373
    .local v1, "count":I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 374
    .local v0, "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, "1"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->isoCode:Ljava/lang/String;

    const-string/jumbo v6, "US"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    :cond_0
    move v3, v2

    .line 396
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_1
    :goto_1
    return v3

    .line 377
    .restart local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 378
    goto :goto_0

    .line 379
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_3
    const/4 v2, 0x0

    .line 380
    const-string/jumbo v4, "1"

    invoke-virtual {p1, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 381
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 382
    .restart local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 383
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 386
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_5
    const/4 v4, 0x1

    if-gt v1, v4, :cond_1

    if-eqz v1, :cond_1

    .line 390
    :cond_6
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 391
    .restart local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v5, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    move v3, v2

    .line 392
    goto :goto_1

    .line 394
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 395
    goto :goto_3
.end method

.method private findCountryByIso(Ljava/lang/String;)I
    .locals 4
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 360
    const/4 v1, 0x0

    .line 361
    .local v1, "i":I
    iget-object v2, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 362
    .local v0, "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v3, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->isoCode:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 367
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    .end local v1    # "i":I
    :goto_1
    return v1

    .line 365
    .restart local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    .restart local v1    # "i":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 366
    goto :goto_0

    .line 367
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_1
    const/4 v1, -0x1

    goto :goto_1
.end method

.method static synthetic lambda$onCreateContentView$0(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "source"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "dest"    # Landroid/text/Spanned;
    .param p4, "dstart"    # I
    .param p5, "dend"    # I

    .prologue
    .line 191
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "[^0-9+]"

    const-string/jumbo v3, ""

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    .local v0, "s":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 193
    const-string/jumbo v1, "+"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 195
    :cond_0
    return-object v0
.end method

.method static synthetic lambda$onCreateContentView$1(Ljava/lang/CharSequence;IILandroid/text/Spanned;II)Ljava/lang/CharSequence;
    .locals 3
    .param p0, "source"    # Ljava/lang/CharSequence;
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "dest"    # Landroid/text/Spanned;
    .param p4, "dstart"    # I
    .param p5, "dend"    # I

    .prologue
    .line 197
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "[^0-9]"

    const-string/jumbo v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setCountry(I)V
    .locals 5
    .param p1, "pos"    # I

    .prologue
    const v4, 0x7f100537

    .line 400
    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->dontUpdateField:Z

    if-eqz v1, :cond_0

    .line 401
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->dontUpdateField:Z

    .line 407
    :goto_0
    return-void

    .line 404
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 405
    .local v0, "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "+"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 406
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iget-object v2, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->setSelection(I)V

    goto :goto_0
.end method

.method private setResultAndFinish(Ljava/lang/String;)V
    .locals 4
    .param p1, "number"    # Ljava/lang/String;

    .prologue
    .line 136
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 137
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 138
    const/4 v1, -0x1

    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    const-string/jumbo v3, "phone"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 139
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 141
    :cond_0
    return-void
.end method


# virtual methods
.method public getNumber()Ljava/lang/String;
    .locals 3

    .prologue
    .line 417
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v2, 0x7f100537

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v2, 0x7f100538

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isFilled()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 421
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v2, 0x7f100537

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    if-le v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v2, 0x7f100538

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->length()I

    move-result v0

    const/4 v2, 0x3

    if-le v0, v2, :cond_0

    move v0, v1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onCreateContentView$2(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 327
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 328
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 329
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 15
    .param p1, "state"    # Landroid/os/Bundle;

    .prologue
    .line 87
    invoke-super/range {p0 .. p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 90
    :try_start_0
    iget-object v11, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->clear()V

    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v11

    invoke-virtual {v11}, Landroid/app/Activity;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v11

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "countries_"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string/jumbo v13, ".txt"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 92
    .local v3, "in":Ljava/io/InputStream;
    invoke-virtual {v3}, Ljava/io/InputStream;->available()I

    move-result v11

    new-array v1, v11, [B

    .line 93
    .local v1, "file":[B
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    .line 94
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    .line 95
    new-instance v11, Ljava/lang/String;

    const-string/jumbo v12, "UTF-8"

    invoke-direct {v11, v1, v12}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string/jumbo v12, "\n"

    invoke-virtual {v11, v12}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 96
    .local v6, "lines":[Ljava/lang/String;
    array-length v12, v6

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v12, :cond_0

    aget-object v5, v6, v11

    .line 97
    .local v5, "line":Ljava/lang/String;
    const-string/jumbo v13, ","

    const/4 v14, 0x4

    invoke-virtual {v5, v13, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    .line 98
    .local v4, "info":[Ljava/lang/String;
    new-instance v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    const/4 v13, 0x0

    invoke-direct {v0, v13}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;)V

    .line 99
    .local v0, "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    const/4 v13, 0x0

    aget-object v13, v4, v13

    iput-object v13, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    .line 100
    const/4 v13, 0x2

    aget-object v13, v4, v13

    iput-object v13, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->isoCode:Ljava/lang/String;

    .line 101
    const/4 v13, 0x3

    aget-object v13, v4, v13

    iput-object v13, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->name:Ljava/lang/String;

    .line 102
    iget-object v13, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 104
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    .end local v1    # "file":[B
    .end local v3    # "in":Ljava/io/InputStream;
    .end local v4    # "info":[Ljava/lang/String;
    .end local v5    # "line":Ljava/lang/String;
    .end local v6    # "lines":[Ljava/lang/String;
    :catch_0
    move-exception v10

    .line 105
    .local v10, "x":Ljava/lang/Exception;
    const-string/jumbo v11, "vk"

    invoke-static {v11, v10}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 108
    .end local v10    # "x":Ljava/lang/Exception;
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v11

    const-string/jumbo v12, "phone"

    invoke-virtual {v11, v12}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/telephony/TelephonyManager;

    .line 110
    .local v8, "tm":Landroid/telephony/TelephonyManager;
    invoke-virtual {v8}, Landroid/telephony/TelephonyManager;->getSimCountryIso()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v7

    .line 111
    .local v7, "simCountry":Ljava/lang/String;
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v11

    const/4 v12, 0x2

    if-ne v11, v12, :cond_2

    .line 112
    move-object v9, v7

    .line 116
    .local v9, "userCountry":Ljava/lang/String;
    :goto_1
    const/4 v2, 0x0

    .line 117
    .local v2, "i":I
    iget-object v11, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 118
    .restart local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v12, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->isoCode:Ljava/lang/String;

    invoke-virtual {v9, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1

    .line 119
    iput v2, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    .line 121
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 122
    goto :goto_2

    .line 114
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    .end local v2    # "i":I
    .end local v9    # "userCountry":Ljava/lang/String;
    :cond_2
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v11

    invoke-virtual {v11}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v9

    .restart local v9    # "userCountry":Ljava/lang/String;
    goto :goto_1

    .line 124
    .restart local v2    # "i":I
    :cond_3
    const v11, 0x7f0804a1

    invoke-virtual {p0, v11}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setTitle(I)V

    .line 125
    const/4 v11, 0x1

    invoke-virtual {p0, v11}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setHasOptionsMenu(Z)V

    .line 126
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 11
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 165
    const v6, 0x7f0301fb

    const/4 v7, 0x0

    invoke-virtual {p1, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v6

    iput-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    .line 167
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100088

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    .line 168
    .local v5, "topBlock":Landroid/view/View;
    invoke-virtual {v5}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .local v1, "pl":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    .local v3, "pt":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    .local v2, "pr":I
    invoke-virtual {v5}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 169
    .local v0, "pb":I
    new-instance v7, Lcom/vkontakte/android/ui/cardview/CardDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const/4 v9, -0x1

    const/high16 v6, 0x40000000    # 2.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    int-to-float v10, v6

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->isTablet:Z

    if-nez v6, :cond_0

    const/4 v6, 0x1

    :goto_0
    invoke-direct {v7, v8, v9, v10, v6}, Lcom/vkontakte/android/ui/cardview/CardDrawable;-><init>(Landroid/content/res/Resources;IFZ)V

    invoke-virtual {v5, v7}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 170
    invoke-virtual {v5, v1, v3, v2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 172
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100535

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Spinner;

    .line 173
    .local v4, "spinner":Landroid/widget/Spinner;
    new-instance v6, Lcom/vkontakte/android/fragments/SignupPhoneFragment$CountriesAdapter;

    const/4 v7, 0x0

    invoke-direct {v6, p0, v7}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$CountriesAdapter;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;)V

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setAdapter(Landroid/widget/SpinnerAdapter;)V

    .line 174
    new-instance v6, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;

    invoke-direct {v6, p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    .line 187
    iget v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    invoke-virtual {v4, v6}, Landroid/widget/Spinner;->setSelection(I)V

    .line 188
    iget v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->selectedCountry:I

    invoke-direct {p0, v6}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setCountry(I)V

    .line 190
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100537

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Landroid/text/InputFilter;

    const/4 v8, 0x0

    invoke-static {}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$1;->lambdaFactory$()Landroid/text/InputFilter;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v6, v7}, Landroid/text/Editable;->setFilters([Landroid/text/InputFilter;)V

    .line 197
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100538

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    invoke-virtual {v6}, Landroid/widget/EditText;->getEditableText()Landroid/text/Editable;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Landroid/text/InputFilter;

    const/4 v8, 0x0

    invoke-static {}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$2;->lambdaFactory$()Landroid/text/InputFilter;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v6, v7}, Landroid/text/Editable;->setFilters([Landroid/text/InputFilter;)V

    .line 198
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100537

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/SignupPhoneFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$2;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 260
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100538

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/SignupPhoneFragment$3;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$3;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 307
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100538

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/EditText;

    new-instance v7, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V

    invoke-virtual {v6, v7}, Landroid/widget/EditText;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    .line 318
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    new-instance v7, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;-><init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V

    invoke-virtual {v6, v7}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 325
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100240

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 330
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v7, 0x7f100240

    invoke-virtual {v6, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    iget-boolean v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->showForgot:Z

    if-eqz v6, :cond_1

    const/4 v6, 0x0

    :goto_1
    invoke-virtual {v7, v6}, Landroid/view/View;->setVisibility(I)V

    .line 332
    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    return-object v6

    .line 169
    .end local v4    # "spinner":Landroid/widget/Spinner;
    :cond_0
    const/4 v6, 0x0

    goto/16 :goto_0

    .line 330
    .restart local v4    # "spinner":Landroid/widget/Spinner;
    :cond_1
    const/16 v6, 0x8

    goto :goto_1
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;
    .param p2, "inflater"    # Landroid/view/MenuInflater;

    .prologue
    .line 130
    const v0, 0x7f110012

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 131
    const v0, 0x7f10001a

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 132
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    .line 133
    return-void

    .line 131
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 145
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    const v2, 0x7f10001a

    if-ne v1, v2, :cond_1

    .line 146
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v0

    .line 147
    .local v0, "phone":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 148
    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->setResultAndFinish(Ljava/lang/String;)V

    .line 150
    :cond_0
    const/4 v1, 0x1

    .line 152
    .end local v0    # "phone":Ljava/lang/String;
    :goto_0
    return v1

    :cond_1
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_0
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 158
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 159
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "show_toolbar"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_1

    .line 160
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 161
    :cond_1
    return-void
.end method

.method public setNumber(Ljava/lang/String;)V
    .locals 7
    .param p1, "_num"    # Ljava/lang/String;

    .prologue
    .line 336
    const-string/jumbo v3, ""

    .line 337
    .local v3, "num":Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 338
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 339
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 340
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 337
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 343
    .end local v0    # "c":C
    :cond_1
    const/4 v2, 0x0

    .line 344
    .local v2, "longestCode":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->countries:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;

    .line 345
    .local v0, "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 346
    if-eqz v2, :cond_3

    iget-object v5, v0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v6, v2, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-le v5, v6, :cond_2

    .line 347
    :cond_3
    move-object v2, v0

    goto :goto_1

    .line 351
    .end local v0    # "c":Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;
    :cond_4
    if-nez v2, :cond_5

    .line 357
    :goto_2
    return-void

    .line 354
    :cond_5
    iget-object v4, v2, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 355
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v5, 0x7f100537

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "+"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v2, Lcom/vkontakte/android/fragments/SignupPhoneFragment$Country;->code:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 356
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v5, 0x7f100538

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/EditText;

    invoke-virtual {v4, v3}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2
.end method

.method public setOnDoneFunc(Lcom/vkontakte/android/functions/VoidF0;)V
    .locals 0
    .param p1, "doneFunc"    # Lcom/vkontakte/android/functions/VoidF0;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->doneFunc:Lcom/vkontakte/android/functions/VoidF0;

    .line 84
    return-void
.end method

.method public setShowForgitButton(Z)V
    .locals 2
    .param p1, "show"    # Z

    .prologue
    .line 410
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->showForgot:Z

    .line 411
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->view:Landroid/view/View;

    const v1, 0x7f100240

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz p1, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 414
    :cond_0
    return-void

    .line 412
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method
