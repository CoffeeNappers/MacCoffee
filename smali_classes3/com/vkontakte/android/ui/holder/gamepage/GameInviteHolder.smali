.class public Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameInviteHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/GameRequest;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public appName:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public appSubtitle:Landroid/widget/TextView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

.field public icon:Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public msg:Landroid/widget/TextView;

.field public name:Landroid/widget/TextView;

.field public photo:Lcom/vk/imageloader/view/VKImageView;

.field public time:Landroid/widget/TextView;

.field protected final visitSource:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 47
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "drawable"    # Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .prologue
    .line 51
    const v0, 0x7f03003d

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;I)V

    .line 52
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;I)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "drawable"    # Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;
    .param p4, "layoutRes"    # I

    .prologue
    .line 55
    invoke-direct {p0, p4, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 56
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    .line 57
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->visitSource:Ljava/lang/String;

    .line 59
    if-eqz p3, :cond_0

    .line 60
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->itemView:Landroid/view/View;

    invoke-virtual {v3, p3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 62
    :cond_0
    const v3, 0x7f1001d5

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->name:Landroid/widget/TextView;

    .line 63
    const v3, 0x7f1001d6

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->msg:Landroid/widget/TextView;

    .line 64
    const v3, 0x7f10000a

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appName:Landroid/widget/TextView;

    .line 65
    const v3, 0x7f100009

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appSubtitle:Landroid/widget/TextView;

    .line 66
    const v3, 0x7f1001d4

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->time:Landroid/widget/TextView;

    .line 67
    const v3, 0x7f1001d3

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKImageView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 68
    const v3, 0x7f100007

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKImageView;

    iput-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 69
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v3, p0}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    const v3, 0x7f1001d7

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v0

    .line 71
    .local v0, "buttonGoToGame":Landroid/view/View;
    if-eqz v0, :cond_1

    .line 72
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    :cond_1
    const v3, 0x7f1001d8

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v1

    .line 75
    .local v1, "buttonHide":Landroid/view/View;
    if-eqz v1, :cond_2

    .line 76
    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 78
    :cond_2
    const v3, 0x7f1001d9

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v2

    .line 79
    .local v2, "view":Landroid/view/View;
    if-eqz v2, :cond_3

    .line 80
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 82
    :cond_3
    const v3, 0x7f1001da

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->$(I)Landroid/view/View;

    move-result-object v2

    .line 83
    if-eqz v2, :cond_4

    .line 84
    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 86
    :cond_4
    return-void
.end method

.method private static createForegroundColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x0

    .line 165
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 166
    .local v0, "sb":Landroid/text/Spannable;
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 167
    return-object v0
.end method

.method private createTitle(Ljava/util/List;I)Landroid/text/SpannableStringBuilder;
    .locals 10
    .param p2, "typeRequest"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;I)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .prologue
    .local p1, "userProfiles":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v9, 0x1

    const/16 v8, 0x20

    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0f00ea

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    .line 90
    .local v1, "colorTextBlue":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0f005d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    .line 91
    .local v0, "colorGameGray":I
    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 92
    .local v5, "title":Landroid/text/SpannableStringBuilder;
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 93
    .local v3, "ids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Integer;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    if-ge v2, v6, :cond_3

    .line 94
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    .line 95
    .local v4, "profile":Lcom/vkontakte/android/UserProfile;
    iget v6, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 93
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 98
    :cond_0
    iget v6, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 99
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ne v2, v6, :cond_2

    if-eqz v2, :cond_2

    .line 100
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    const v7, 0x7f080474

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->createForegroundColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 104
    :cond_1
    :goto_2
    iget-object v6, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-static {v6, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->createTypefaceSpanColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_1

    .line 101
    :cond_2
    if-eqz v2, :cond_1

    .line 102
    const-string/jumbo v6, ", "

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->createForegroundColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    goto :goto_2

    .line 107
    .end local v4    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_3
    if-ne p2, v9, :cond_4

    .line 108
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v6

    if-le v6, v9, :cond_5

    const v6, 0x7f080262

    :goto_3
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->createForegroundColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 110
    :cond_4
    return-object v5

    .line 108
    :cond_5
    const v6, 0x7f080260

    goto :goto_3
.end method

.method private static createTypefaceSpanColorSpan(Ljava/lang/String;I)Landroid/text/Spannable;
    .locals 4
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "color"    # I

    .prologue
    const/4 v3, 0x0

    .line 171
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 172
    .local v0, "sb":Landroid/text/Spannable;
    new-instance v1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v1, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 173
    new-instance v1, Lcom/vkontakte/android/utils/TypefaceSpanAssets;

    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/utils/TypefaceSpanAssets;-><init>(Landroid/graphics/Typeface;)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v2

    invoke-interface {v0, v1, v3, v2, v3}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 174
    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/GameRequest;)V
    .locals 9
    .param p1, "r"    # Lcom/vkontakte/android/data/GameRequest;

    .prologue
    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v7, 0x1

    .line 115
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appName:Landroid/widget/TextView;

    if-eqz v2, :cond_0

    .line 116
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appName:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 118
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appSubtitle:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    .line 119
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->appSubtitle:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/data/GameRequest;->appGenre:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 122
    :cond_1
    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_7

    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_7

    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    move-object v0, v2

    .line 124
    .local v0, "activeUser":Lcom/vkontakte/android/UserProfile;
    :goto_0
    if-eqz v0, :cond_8

    .line 125
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 130
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v2, :cond_2

    .line 131
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, p1, Lcom/vkontakte/android/data/GameRequest;->appUrl:Ljava/lang/String;

    invoke-virtual {v2, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 134
    :cond_2
    invoke-virtual {p1}, Lcom/vkontakte/android/data/GameRequest;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/text/SpannableStringBuilder;

    .line 135
    .local v1, "title":Landroid/text/SpannableStringBuilder;
    if-nez v1, :cond_3

    .line 136
    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    iget v4, p1, Lcom/vkontakte/android/data/GameRequest;->type:I

    invoke-direct {p0, v2, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->createTitle(Ljava/util/List;I)Landroid/text/SpannableStringBuilder;

    move-result-object v1

    .line 137
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/data/GameRequest;->setTag(Ljava/lang/Object;)V

    .line 139
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->name:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 140
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->time:Landroid/widget/TextView;

    if-eqz v2, :cond_4

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->time:Landroid/widget/TextView;

    iget v4, p1, Lcom/vkontakte/android/data/GameRequest;->time:I

    int-to-long v4, v4

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/vkontakte/android/TimeUtils;->shortDate(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    :cond_4
    iget v2, p1, Lcom/vkontakte/android/data/GameRequest;->type:I

    if-ne v2, v7, :cond_9

    .line 145
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->msg:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 154
    :cond_5
    :goto_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    if-nez v0, :cond_d

    move-object v2, v3

    :goto_3
    invoke-virtual {v4, v2}, Lcom/vk/imageloader/view/VKImageView;->setTag(Ljava/lang/Object;)V

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    if-eqz v2, :cond_6

    .line 157
    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;->updateRequest(Lcom/vkontakte/android/data/GameRequest;)V

    .line 158
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->itemView:Landroid/view/View;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->drawable:Lcom/vkontakte/android/ui/drawables/RequestBgDrawable;

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 160
    :cond_6
    return-void

    .end local v0    # "activeUser":Lcom/vkontakte/android/UserProfile;
    .end local v1    # "title":Landroid/text/SpannableStringBuilder;
    :cond_7
    move-object v0, v3

    .line 122
    goto :goto_0

    .line 127
    .restart local v0    # "activeUser":Lcom/vkontakte/android/UserProfile;
    :cond_8
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_1

    .line 146
    .restart local v1    # "title":Landroid/text/SpannableStringBuilder;
    :cond_9
    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_a

    .line 147
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->msg:Landroid/widget/TextView;

    iget-object v4, p1, Lcom/vkontakte/android/data/GameRequest;->text:Ljava/lang/String;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 148
    :cond_a
    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    if-eqz v2, :cond_b

    iget-object v2, p1, Lcom/vkontakte/android/data/GameRequest;->userProfiles:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-le v2, v7, :cond_b

    .line 149
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->msg:Landroid/widget/TextView;

    const v4, 0x7f080270

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 150
    :cond_b
    if-eqz v0, :cond_5

    .line 151
    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->msg:Landroid/widget/TextView;

    iget-boolean v2, v0, Lcom/vkontakte/android/UserProfile;->f:Z

    if-eqz v2, :cond_c

    const v2, 0x7f08026e

    :goto_4
    new-array v5, v7, [Ljava/lang/Object;

    iget-object v6, p1, Lcom/vkontakte/android/data/GameRequest;->appTitle:Ljava/lang/String;

    aput-object v6, v5, v8

    invoke-virtual {p0, v2, v5}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    :cond_c
    const v2, 0x7f08026f

    goto :goto_4

    .line 154
    :cond_d
    iget v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_3
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 28
    check-cast p1, Lcom/vkontakte/android/data/GameRequest;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->onBind(Lcom/vkontakte/android/data/GameRequest;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    .line 187
    .local v0, "currentRequest":Lcom/vkontakte/android/data/GameRequest;
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 216
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 189
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->onPlayButtonClick()V

    .line 192
    :pswitch_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/vkontakte/android/data/Games;->deleteRequestAll(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    goto :goto_0

    .line 195
    :pswitch_3
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 196
    .local v1, "uid":Ljava/lang/Integer;
    if-eqz v1, :cond_0

    .line 197
    new-instance v2, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 201
    .end local v1    # "uid":Ljava/lang/Integer;
    :pswitch_4
    if-eqz v0, :cond_0

    .line 202
    iget-object v2, v0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v2, v2, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v2, :cond_1

    iget v2, v0, Lcom/vkontakte/android/data/GameRequest;->type:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 203
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->visitSource:Ljava/lang/String;

    invoke-static {v0, v2, v3}, Lcom/vkontakte/android/ui/holder/gamepage/GameRequestHolder;->openGame(Lcom/vkontakte/android/data/GameRequest;Landroid/app/Activity;Ljava/lang/String;)V

    .line 204
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/vkontakte/android/data/Games;->deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    goto :goto_0

    .line 207
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->visitSource:Ljava/lang/String;

    const-string/jumbo v4, "request"

    iget-object v5, v0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    invoke-static {v2, v3, v4, v5}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/data/ApiApplication;)V

    .line 208
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/vkontakte/android/data/Games;->deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    goto :goto_0

    .line 213
    :pswitch_5
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v0}, Lcom/vkontakte/android/data/Games;->deleteRequest(Landroid/content/Context;Lcom/vkontakte/android/data/GameRequest;)V

    goto :goto_0

    .line 187
    :pswitch_data_0
    .packed-switch 0x7f1001d3
        :pswitch_3
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method

.method protected onPlayButtonClick()V
    .locals 5

    .prologue
    .line 178
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/GameRequest;

    iget-object v1, v0, Lcom/vkontakte/android/data/GameRequest;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInviteHolder;->visitSource:Ljava/lang/String;

    const-string/jumbo v4, "request"

    invoke-static {v1, v2, v0, v3, v4}, Lcom/vkontakte/android/data/Games;->open(Lcom/vkontakte/android/data/ApiApplication;Landroid/os/Bundle;Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    return-void
.end method
