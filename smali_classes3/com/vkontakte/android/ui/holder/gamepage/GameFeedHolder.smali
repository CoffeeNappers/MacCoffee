.class public Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameFeedHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/GameFeedEntry;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private clickSource:Ljava/lang/String;

.field private final icon:Lcom/vk/imageloader/view/VKImageView;

.field private final instantGameBadge:Landroid/widget/ImageView;

.field private final isNeedShowDate:Z

.field private openCardByClick:Z

.field private final photo:Lcom/vk/imageloader/view/VKImageView;

.field private final text:Landroid/widget/TextView;

.field private visitSource:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;-><init>(Landroid/view/ViewGroup;Z)V

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/view/ViewGroup;Z)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "isNeedShowDate"    # Z

    .prologue
    .line 49
    const v0, 0x7f030034

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 36
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->openCardByClick:Z

    .line 50
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->isNeedShowDate:Z

    .line 52
    const v0, 0x7f1001be

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->text:Landroid/widget/TextView;

    .line 53
    const v0, 0x7f1001b3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->instantGameBadge:Landroid/widget/ImageView;

    .line 54
    const v0, 0x7f1001bc

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    const v0, 0x7f1001bd

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 57
    if-eqz p2, :cond_0

    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 60
    :cond_0
    return-void
.end method

.method private static spanForAppTitle(Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "appTitle"    # Ljava/lang/String;
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x0

    .line 145
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 146
    .local v0, "spannable":Landroid/text/Spannable;
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 147
    return-object v0
.end method

.method private static spanForSecondArgs(I)Ljava/lang/CharSequence;
    .locals 1
    .param p0, "arg"    # I

    .prologue
    .line 135
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method private static spanForSecondArgs(Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "arg"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 139
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 140
    .local v0, "spannable":Landroid/text/Spannable;
    new-instance v1, Lcom/vkontakte/android/utils/TypefaceSpanAssets;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/TypefaceSpanAssets;-><init>(Landroid/graphics/Typeface;)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 141
    return-object v0
.end method

.method private static spanForUserName(Ljava/lang/String;I)Ljava/lang/CharSequence;
    .locals 4
    .param p0, "userName"    # Ljava/lang/String;
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x0

    .line 151
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 152
    .local v0, "spannable":Landroid/text/Spannable;
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 153
    new-instance v1, Lcom/vkontakte/android/utils/TypefaceSpanAssets;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/TypefaceSpanAssets;-><init>(Landroid/graphics/Typeface;)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 154
    return-object v0
.end method


# virtual methods
.method formatText(Lcom/vkontakte/android/data/GameFeedEntry;)Ljava/lang/CharSequence;
    .locals 11
    .param p1, "data"    # Lcom/vkontakte/android/data/GameFeedEntry;

    .prologue
    const/4 v7, 0x3

    const/4 v9, 0x2

    const/4 v8, 0x1

    const/4 v10, 0x0

    .line 85
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0f00ea

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 86
    .local v0, "colorTextBlue":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0f00ec

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 87
    .local v1, "colorTextLightGray":I
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 89
    .local v2, "result":Landroid/text/SpannableStringBuilder;
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-static {v5, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForUserName(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v4

    .line 91
    .local v4, "userName":Ljava/lang/CharSequence;
    sget-object v5, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder$1;->$SwitchMap$com$vkontakte$android$data$GameFeedEntry$Type:[I

    iget-object v6, p1, Lcom/vkontakte/android/data/GameFeedEntry;->type:Lcom/vkontakte/android/data/GameFeedEntry$Type;

    invoke-virtual {v6}, Lcom/vkontakte/android/data/GameFeedEntry$Type;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 94
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_0

    const v5, 0x7f08025e

    :goto_0
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v7, v7, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    .line 95
    invoke-static {v7, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForAppTitle(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    .line 94
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 126
    :goto_1
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v6

    iget-boolean v5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->isNeedShowDate:Z

    if-eqz v5, :cond_8

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "\n"

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->date:I

    .line 127
    invoke-static {v7}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 126
    :goto_2
    invoke-virtual {v6, v5}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v3

    .line 129
    .local v3, "time":Landroid/text/Spannable;
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v5, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v3}, Landroid/text/Spannable;->length()I

    move-result v6

    invoke-interface {v3, v5, v10, v6, v10}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 130
    const-string/jumbo v5, " "

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 131
    return-object v2

    .line 94
    .end local v3    # "time":Landroid/text/Spannable;
    :cond_0
    const v5, 0x7f08025f

    goto :goto_0

    .line 98
    :pswitch_0
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->isNeedShowDate:Z

    if-eqz v5, :cond_2

    .line 99
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_1

    const v5, 0x7f080266

    :goto_3
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->level:I

    .line 100
    invoke-static {v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    .line 99
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    :cond_1
    const v5, 0x7f080268

    goto :goto_3

    .line 102
    :cond_2
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_3

    const v5, 0x7f080265

    :goto_4
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->level:I

    .line 103
    invoke-static {v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v7, v7, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-static {v7, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForAppTitle(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v9

    .line 102
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    :cond_3
    const v5, 0x7f080267

    goto :goto_4

    .line 107
    :pswitch_1
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->isNeedShowDate:Z

    if-eqz v5, :cond_4

    .line 108
    const v5, 0x7f080254

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->text:Ljava/lang/String;

    .line 109
    invoke-static {v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    .line 108
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    .line 111
    :cond_4
    const v5, 0x7f080253

    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->text:Ljava/lang/String;

    aput-object v7, v6, v8

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v7, v7, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    .line 112
    invoke-static {v7, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForAppTitle(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v9

    .line 111
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    .line 116
    :pswitch_2
    iget-boolean v5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->isNeedShowDate:Z

    if-eqz v5, :cond_6

    .line 117
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_5

    const v5, 0x7f080279

    :goto_5
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v9, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->value:I

    .line 118
    invoke-static {v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    .line 117
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    :cond_5
    const v5, 0x7f08027b

    goto :goto_5

    .line 120
    :cond_6
    iget-object v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-boolean v5, v5, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v5, :cond_7

    const v5, 0x7f080278

    :goto_6
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    new-array v6, v7, [Ljava/lang/Object;

    aput-object v4, v6, v10

    iget v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->value:I

    .line 121
    invoke-static {v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForSecondArgs(I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    iget-object v7, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v7, v7, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-static {v7, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->spanForAppTitle(Ljava/lang/String;I)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v9

    .line 120
    invoke-static {v5, v6}, Lcom/vkontakte/android/utils/SpanHelper;->format(Ljava/lang/CharSequence;[Ljava/lang/Object;)Landroid/text/SpannableStringBuilder;

    move-result-object v5

    invoke-virtual {v2, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto/16 :goto_1

    :cond_7
    const v5, 0x7f08027a

    goto :goto_6

    .line 127
    :cond_8
    iget v5, p1, Lcom/vkontakte/android/data/GameFeedEntry;->date:I

    int-to-long v8, v5

    .line 128
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v8, v9, v5}, Lcom/vkontakte/android/TimeUtils;->shortDate(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_2

    .line 91
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public onBind(Lcom/vkontakte/android/data/GameFeedEntry;)V
    .locals 4
    .param p1, "data"    # Lcom/vkontakte/android/data/GameFeedEntry;

    .prologue
    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setTag(Ljava/lang/Object;)V

    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameFeedEntry;->user:Lcom/vkontakte/android/UserProfile;

    iget-object v2, v2, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v2, v2, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v3, 0x42400000    # 48.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 74
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->instantGameBadge:Landroid/widget/ImageView;

    iget-object v1, p1, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v1, v1, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 75
    invoke-virtual {p1}, Lcom/vkontakte/android/data/GameFeedEntry;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 76
    .local v0, "formattedText":Ljava/lang/CharSequence;
    if-nez v0, :cond_0

    .line 77
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->formatText(Lcom/vkontakte/android/data/GameFeedEntry;)Ljava/lang/CharSequence;

    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/data/GameFeedEntry;->setTag(Ljava/lang/Object;)V

    .line 81
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 82
    return-void

    .line 74
    .end local v0    # "formattedText":Ljava/lang/CharSequence;
    :cond_1
    const/16 v1, 0x8

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 32
    check-cast p1, Lcom/vkontakte/android/data/GameFeedEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->onBind(Lcom/vkontakte/android/data/GameFeedEntry;)V

    return-void
.end method

.method public onClick()V
    .locals 5

    .prologue
    .line 161
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->openCardByClick:Z

    if-nez v0, :cond_0

    .line 162
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameFeedEntry;

    iget-object v1, v0, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->visitSource:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->clickSource:Ljava/lang/String;

    invoke-static {v1, v2, v0, v3, v4}, Lcom/vkontakte/android/data/Games;->open(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 166
    :goto_0
    return-void

    .line 164
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->visitSource:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->clickSource:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameFeedEntry;

    iget-object v0, v0, Lcom/vkontakte/android/data/GameFeedEntry;->app:Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v1, v2, v3, v0}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/ApiApplication;)V

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 170
    new-instance v1, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    .line 171
    return-void
.end method

.method public setClickInfo(ZLjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;
    .locals 0
    .param p1, "openCardByClick"    # Z
    .param p2, "visitSource"    # Ljava/lang/String;
    .param p3, "clickSource"    # Ljava/lang/String;

    .prologue
    .line 63
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->openCardByClick:Z

    .line 64
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->visitSource:Ljava/lang/String;

    .line 65
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameFeedHolder;->clickSource:Ljava/lang/String;

    .line 66
    return-object p0
.end method
