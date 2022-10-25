.class public Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "MusicWasPausedFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static showed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;->showed:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    return-void
.end method

.method public static show(Landroid/content/Context;Landroid/app/Activity;)V
    .locals 6
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 42
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 43
    .local v0, "args":Landroid/os/Bundle;
    new-instance v2, Lcom/vkontakte/android/navigation/Navigator;

    const-class v3, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;

    new-instance v4, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v5, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v5, 0x439c0000    # 312.0f

    .line 45
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v4

    const/high16 v5, 0x42000000    # 32.0f

    .line 46
    invoke-static {v5}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v4

    const/16 v5, 0x11

    .line 47
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v4

    const v5, 0x7f0203db

    .line 48
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v4

    invoke-direct {v2, v3, v4, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    .line 49
    .local v2, "navigator":Lcom/vkontakte/android/navigation/Navigator;
    sget-boolean v3, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;->showed:Z

    if-nez v3, :cond_0

    .line 50
    if-eqz p1, :cond_1

    .line 51
    invoke-virtual {v2, p1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 58
    :cond_0
    :goto_0
    return-void

    .line 53
    :cond_1
    invoke-virtual {v2, p0}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    .line 54
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v3, 0x10000000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 55
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 80
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 89
    :goto_0
    return-void

    .line 82
    :sswitch_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 85
    :sswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->show(Landroid/content/Context;)V

    .line 86
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 80
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f10029a -> :sswitch_0
        0x7f1002ad -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 31
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreate(Landroid/os/Bundle;)V

    .line 32
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;->showed:Z

    .line 33
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 8
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 63
    const v6, 0x7f0300a5

    const/4 v7, 0x0

    invoke-virtual {p1, v6, p2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 65
    .local v5, "view":Landroid/view/View;
    const v6, 0x7f10029a

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 66
    .local v0, "closeBtn":Landroid/view/View;
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    const v6, 0x7f10029b

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 68
    .local v1, "closeBtnImg":Landroid/view/View;
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v6

    const v7, 0x7f02018a

    invoke-static {v6, v7}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 69
    .local v2, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f0f005f

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    .line 70
    .local v4, "gray":I
    new-instance v3, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-direct {v3, v2, v4}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 71
    .end local v2    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v3, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 73
    const v6, 0x7f1002ad

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    return-object v5
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 37
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroy()V

    .line 38
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/MusicWasPausedFragment;->showed:Z

    .line 39
    return-void
.end method
