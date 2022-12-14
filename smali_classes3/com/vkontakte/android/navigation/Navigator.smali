.class public Lcom/vkontakte/android/navigation/Navigator;
.super Ljava/lang/Object;
.source "Navigator.java"

# interfaces
.implements Lcom/vkontakte/android/navigation/ArgKeys;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;
    }
.end annotation


# instance fields
.field protected final args:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private final mActivityArgs:Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final mFragmentClazz:Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field final mTargetActivity:Ljava/lang/Class;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 29
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    const/4 v0, 0x0

    .line 32
    invoke-direct {p0, p1, v0, p2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;)V
    .locals 3
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "targetActivity"    # Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;",
            ")V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    iget-object v0, p2, Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;->mTargetActivity:Ljava/lang/Class;

    const/4 v1, 0x0

    iget-object v2, p2, Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;->args:Landroid/os/Bundle;

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "targetActivity"    # Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 48
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    iget-object v0, p2, Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;->mTargetActivity:Ljava/lang/Class;

    iget-object v1, p2, Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;->args:Landroid/os/Bundle;

    invoke-direct {p0, p1, v0, p3, v1}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    .local p2, "targetActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    const/4 v0, 0x0

    .line 36
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 40
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    .local p2, "targetActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V

    .line 41
    return-void
.end method

.method private constructor <init>(Ljava/lang/Class;Ljava/lang/Class;Landroid/os/Bundle;Landroid/os/Bundle;)V
    .locals 0
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "activityArgs"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Activity;",
            ">;",
            "Landroid/os/Bundle;",
            "Landroid/os/Bundle;",
            ")V"
        }
    .end annotation

    .prologue
    .line 51
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    .local p2, "targetActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/navigation/Navigator;->mFragmentClazz:Ljava/lang/Class;

    .line 53
    if-nez p2, :cond_0

    const-class p2, Lcom/vkontakte/android/FragmentWrapperActivity;

    .end local p2    # "targetActivity":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Activity;>;"
    :cond_0
    iput-object p2, p0, Lcom/vkontakte/android/navigation/Navigator;->mTargetActivity:Ljava/lang/Class;

    .line 54
    if-nez p3, :cond_1

    new-instance p3, Landroid/os/Bundle;

    .end local p3    # "args":Landroid/os/Bundle;
    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    :cond_1
    iput-object p3, p0, Lcom/vkontakte/android/navigation/Navigator;->args:Landroid/os/Bundle;

    .line 55
    iput-object p4, p0, Lcom/vkontakte/android/navigation/Navigator;->mActivityArgs:Landroid/os/Bundle;

    .line 56
    return-void
.end method


# virtual methods
.method public final forResult(Landroid/app/Activity;I)Z
    .locals 1
    .param p1, "context"    # Landroid/app/Activity;
    .param p2, "requestCode"    # I

    .prologue
    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/navigation/Navigator;->isValidNavigator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 106
    const/4 v0, 0x1

    .line 108
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final forResult(Landroid/app/Fragment;I)Z
    .locals 1
    .param p1, "fragment"    # Landroid/app/Fragment;
    .param p2, "requestCode"    # I

    .prologue
    .line 113
    invoke-virtual {p0}, Lcom/vkontakte/android/navigation/Navigator;->isValidNavigator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 114
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 115
    const/4 v0, 0x1

    .line 117
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final go(Landroid/app/Activity;ZII)Z
    .locals 4
    .param p1, "act"    # Landroid/app/Activity;
    .param p2, "overlay"    # Z
    .param p3, "inAnim"    # I
    .param p4, "outAnim"    # I

    .prologue
    const/4 v3, -0x1

    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/navigation/Navigator;->isValidNavigator()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 79
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/navigation/Navigator;->mTargetActivity:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 80
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "class"

    iget-object v2, p0, Lcom/vkontakte/android/navigation/Navigator;->mFragmentClazz:Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 81
    const-string/jumbo v1, "args"

    iget-object v2, p0, Lcom/vkontakte/android/navigation/Navigator;->args:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 82
    const-string/jumbo v1, "overlaybar"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 83
    if-eq p3, v3, :cond_0

    if-eq p4, v3, :cond_0

    .line 84
    const-string/jumbo v1, "in_anim"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 85
    const-string/jumbo v1, "out_anim"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 87
    :cond_0
    invoke-virtual {p1, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 88
    const/4 v1, 0x1

    .line 90
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public final go(Landroid/app/Fragment;)Z
    .locals 1
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 95
    invoke-virtual {p0}, Lcom/vkontakte/android/navigation/Navigator;->isValidNavigator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/Fragment;->startActivity(Landroid/content/Intent;)V

    .line 97
    const/4 v0, 0x1

    .line 99
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final go(Landroid/content/Context;)Z
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    invoke-virtual {p0}, Lcom/vkontakte/android/navigation/Navigator;->isValidNavigator()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/navigation/Navigator;->intent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 71
    const/4 v0, 0x1

    .line 73
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final intent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/navigation/Navigator;->mTargetActivity:Ljava/lang/Class;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 60
    .local v0, "intent":Landroid/content/Intent;
    iget-object v1, p0, Lcom/vkontakte/android/navigation/Navigator;->mActivityArgs:Landroid/os/Bundle;

    if-eqz v1, :cond_0

    .line 61
    iget-object v1, p0, Lcom/vkontakte/android/navigation/Navigator;->mActivityArgs:Landroid/os/Bundle;

    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 63
    :cond_0
    const-string/jumbo v1, "class"

    iget-object v2, p0, Lcom/vkontakte/android/navigation/Navigator;->mFragmentClazz:Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 64
    const-string/jumbo v1, "args"

    iget-object v2, p0, Lcom/vkontakte/android/navigation/Navigator;->args:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 65
    return-object v0
.end method

.method protected isValidNavigator()Z
    .locals 1

    .prologue
    .line 122
    const/4 v0, 0x1

    return v0
.end method
