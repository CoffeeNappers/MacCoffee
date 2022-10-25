.class public Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GameIconButtonHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/GameCardFragment;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# static fields
.field static handler:Landroid/os/Handler;

.field private static pendingRequest:Ljava/lang/Runnable;


# instance fields
.field private final aSwitch:Landroid/widget/Switch;

.field private lastApp:Lcom/vkontakte/android/data/ApiApplication;

.field private final showSwitch:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 25
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->handler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "showSwitch"    # Z

    .prologue
    .line 34
    const v1, 0x7f030037

    invoke-direct {p0, v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 35
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->showSwitch:Z

    .line 36
    const v1, 0x7f1001c3

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 37
    .local v0, "textView":Landroid/widget/TextView;
    if-eqz p2, :cond_1

    const v1, 0x7f08063a

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 38
    const v1, 0x7f1001c4

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->$(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    iput-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    .line 39
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    if-eqz p2, :cond_2

    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v2, v1}, Landroid/widget/Switch;->setVisibility(I)V

    .line 40
    if-eqz p2, :cond_0

    .line 41
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    invoke-static {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;)Landroid/widget/CompoundButton$OnCheckedChangeListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 43
    :cond_0
    return-void

    .line 37
    :cond_1
    const v1, 0x7f080261

    goto :goto_0

    .line 39
    :cond_2
    const/16 v1, 0x8

    goto :goto_1
.end method

.method public static inviteToGame(Landroid/app/Fragment;I)V
    .locals 2
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "appId"    # I

    .prologue
    .line 89
    new-instance v0, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;-><init>(I)V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/userlist/SendRequestToGameFragment$Builder;->setDisableSpinner()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/4 v1, 0x0

    .line 90
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setGlobalSearch(Z)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const v1, 0x7f0805f4

    invoke-virtual {p0, v1}, Landroid/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setTitle(Ljava/lang/String;)Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    const/16 v1, 0xf3f

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 91
    return-void
.end method

.method private updateNotificationsStateDelayed(Z)V
    .locals 4
    .param p1, "switchState"    # Z

    .prologue
    .line 60
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->pendingRequest:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 61
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->pendingRequest:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 63
    :cond_0
    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;Z)Ljava/lang/Runnable;

    move-result-object v0

    sput-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->pendingRequest:Ljava/lang/Runnable;

    .line 76
    sget-object v0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->handler:Landroid/os/Handler;

    sget-object v1, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->pendingRequest:Ljava/lang/Runnable;

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 77
    return-void
.end method


# virtual methods
.method synthetic lambda$new$0(Landroid/widget/CompoundButton;Z)V
    .locals 0
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    .line 41
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->updateNotificationsStateDelayed(Z)V

    return-void
.end method

.method synthetic lambda$updateNotificationsStateDelayed$1(Z)V
    .locals 4
    .param p1, "switchState"    # Z

    .prologue
    const/4 v1, 0x0

    .line 64
    sput-object v1, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->pendingRequest:Ljava/lang/Runnable;

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->lastApp:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v0, v0, Lcom/vkontakte/android/data/ApiApplication;->notificationsEnabled:Z

    if-ne p1, v0, :cond_0

    .line 75
    :goto_0
    return-void

    .line 68
    :cond_0
    new-instance v2, Lcom/vkontakte/android/api/apps/AppsToggleRequests;

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->lastApp:Lcom/vkontakte/android/data/ApiApplication;

    iget v0, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-direct {v2, v0, p1}, Lcom/vkontakte/android/api/apps/AppsToggleRequests;-><init>(IZ)V

    new-instance v3, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$1;

    move-object v0, v1

    check-cast v0, Landroid/app/Activity;

    invoke-direct {v3, p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder$1;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/apps/AppsToggleRequests;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 74
    invoke-virtual {v0, v1, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->persist(Ljava/lang/reflect/Method;Lorg/json/JSONObject;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public onBind(Lcom/vkontakte/android/fragments/GameCardFragment;)V
    .locals 2
    .param p1, "data"    # Lcom/vkontakte/android/fragments/GameCardFragment;

    .prologue
    .line 47
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->lastApp:Lcom/vkontakte/android/data/ApiApplication;

    .line 48
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->showSwitch:Z

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->lastApp:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v1, v1, Lcom/vkontakte/android/data/ApiApplication;->notificationsEnabled:Z

    invoke-virtual {v0, v1}, Landroid/widget/Switch;->setChecked(Z)V

    .line 51
    :cond_0
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 23
    check-cast p1, Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->onBind(Lcom/vkontakte/android/fragments/GameCardFragment;)V

    return-void
.end method

.method public onClick()V
    .locals 2

    .prologue
    .line 81
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->showSwitch:Z

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->switchValue()V

    .line 86
    :goto_0
    return-void

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/fragments/GameCardFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/GameCardFragment;->getApplication()Lcom/vkontakte/android/data/ApiApplication;

    move-result-object v1

    iget v1, v1, Lcom/vkontakte/android/data/ApiApplication;->id:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->inviteToGame(Landroid/app/Fragment;I)V

    goto :goto_0
.end method

.method public switchValue()V
    .locals 2

    .prologue
    .line 54
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->showSwitch:Z

    if-eqz v0, :cond_0

    .line 55
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameIconButtonHolder;->aSwitch:Landroid/widget/Switch;

    invoke-virtual {v0}, Landroid/widget/Switch;->isChecked()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/Switch;->setChecked(Z)V

    .line 57
    :cond_0
    return-void

    .line 55
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method
