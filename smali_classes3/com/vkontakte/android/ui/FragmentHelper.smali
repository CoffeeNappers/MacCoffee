.class public Lcom/vkontakte/android/ui/FragmentHelper;
.super Ljava/lang/Object;
.source "FragmentHelper.java"


# static fields
.field public static final FRAGMENT_LAYOUT_ID:I = 0x7f10002b


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    return-void
.end method

.method public static extractArgs(Landroid/content/Intent;)Landroid/os/Bundle;
    .locals 1
    .param p0, "intent"    # Landroid/content/Intent;

    .prologue
    .line 77
    const-string/jumbo v0, "args"

    invoke-virtual {p0, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public static extractFragment(Landroid/content/Intent;)Ljava/lang/Class;
    .locals 3
    .param p0, "intent"    # Landroid/content/Intent;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Intent;",
            ")",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    :try_start_0
    const-string/jumbo v1, "class"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :goto_0
    return-object v1

    .line 66
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/ClassCastException;
    const-string/jumbo v1, "AudioListFragment"

    const-string/jumbo v2, "class"

    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 69
    const-class v1, Lcom/vk/music/fragment/MusicFragment;

    goto :goto_0

    .line 71
    :cond_0
    throw v0
.end method

.method public static findFragment(Landroid/app/Activity;)Landroid/app/Fragment;
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f10002b

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v0

    return-object v0
.end method

.method public static replace(Landroid/app/Activity;Landroid/app/Fragment;)Landroid/app/Fragment;
    .locals 3
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 40
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f10002b

    const-string/jumbo v2, "news"

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commit()I

    .line 41
    return-object p1
.end method

.method public static replace(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)Landroid/app/Fragment;
    .locals 4
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "navigationDelegate"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Lcom/vkontakte/android/ui/navigation/NavigationDelegate;",
            ")",
            "Landroid/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 28
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 29
    .local v0, "fragment":Landroid/app/Fragment;
    invoke-virtual {v0, p2}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 30
    invoke-static {p0, v0}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Landroid/app/Fragment;)Landroid/app/Fragment;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 35
    .end local v0    # "fragment":Landroid/app/Fragment;
    :goto_0
    return-object v2

    .line 31
    :catch_0
    move-exception v1

    .line 32
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 33
    const v2, 0x7f0801f9

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 35
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static replaceWithBackStack(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;Lcom/vkontakte/android/ui/navigation/NavigationDelegate;)Landroid/app/Fragment;
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/Class;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "args"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "navigationDelegate"    # Lcom/vkontakte/android/ui/navigation/NavigationDelegate;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Lcom/vkontakte/android/ui/navigation/NavigationDelegate;",
            ")",
            "Landroid/app/Fragment;"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Fragment;

    .line 51
    .local v0, "fragment":Landroid/app/Fragment;
    invoke-virtual {v0, p2}, Landroid/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    .line 52
    invoke-virtual {p0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    const v3, 0x7f10002b

    const-string/jumbo v4, "news"

    invoke-virtual {v2, v3, v0, v4}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v2

    .line 53
    invoke-virtual {v0}, Landroid/app/Fragment;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v0    # "fragment":Landroid/app/Fragment;
    :goto_0
    return-object v0

    .line 55
    :catch_0
    move-exception v1

    .line 56
    .local v1, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    invoke-static {v2, v1}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 57
    const v2, 0x7f0801f9

    const/4 v3, 0x0

    invoke-static {p0, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 58
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 59
    const/4 v0, 0x0

    goto :goto_0
.end method
