.class public Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameAppHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/ApiApplication;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final bubble:Landroid/view/View;

.field private final getterData:Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final icon:Lcom/vk/imageloader/view/VKImageView;

.field private final iconInstant:Landroid/view/View;

.field private final subtitle:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;

.field private final visitSource:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;Landroid/content/Context;Ljava/lang/String;)V
    .locals 1
    .param p1, "getterData"    # Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 44
    const v0, 0x7f0300da

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 45
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getterData:Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;

    .line 46
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->visitSource:Ljava/lang/String;

    .line 48
    const v0, 0x7f100007

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    .line 49
    const v0, 0x7f10000a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->title:Landroid/widget/TextView;

    .line 50
    const v0, 0x7f100009

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->subtitle:Landroid/widget/TextView;

    .line 51
    const v0, 0x7f100006

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bubble:Landroid/view/View;

    .line 52
    const v0, 0x7f1001b3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->iconInstant:Landroid/view/View;

    .line 53
    return-void
.end method

.method public static getIconUrl(Lcom/vkontakte/android/data/ApiApplication;)Ljava/lang/String;
    .locals 2
    .param p0, "item"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v1, 0x42900000    # 72.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/ApiApplication;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/data/ApiApplication;

    .prologue
    const/4 v0, 0x0

    const/16 v1, 0x8

    .line 57
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->title:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->subtitle:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/data/ApiApplication;->description:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 59
    iget-boolean v2, p1, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bubble:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_1

    .line 60
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bubble:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 65
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->iconInstant:Landroid/view/View;

    iget-boolean v3, p1, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v3, :cond_2

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 67
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->icon:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getIconUrl(Lcom/vkontakte/android/data/ApiApplication;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 68
    return-void

    .line 61
    :cond_1
    iget-boolean v2, p1, Lcom/vkontakte/android/data/ApiApplication;->isNew:Z

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bubble:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v2

    if-eq v2, v1, :cond_0

    .line 62
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->bubble:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_2
    move v0, v1

    .line 65
    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 23
    check-cast p1, Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->onBind(Lcom/vkontakte/android/data/ApiApplication;)V

    return-void
.end method

.method public onClick()V
    .locals 5

    .prologue
    .line 82
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getterData:Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;

    invoke-interface {v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder$GetterData;->getApiApplications()Ljava/util/ArrayList;

    move-result-object v0

    .line 83
    .local v0, "apps":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->visitSource:Ljava/lang/String;

    const-string/jumbo v3, "catalog"

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->getItem()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v1, v2, v3, v0, v4}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V

    .line 84
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameAppHolder;->onClick()V

    .line 78
    return-void
.end method
