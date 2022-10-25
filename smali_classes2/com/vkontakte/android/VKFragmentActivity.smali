.class public Lcom/vkontakte/android/VKFragmentActivity;
.super Landroid/support/v7/app/AppCompatActivity;
.source "VKFragmentActivity.java"


# instance fields
.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    .line 18
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/VKFragmentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    return-void
.end method

.method private setTextViewMarquee(Landroid/widget/TextView;)V
    .locals 2
    .param p1, "t"    # Landroid/widget/TextView;

    .prologue
    const/4 v1, 0x1

    .line 104
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 105
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setSelected(Z)V

    .line 106
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 107
    const/high16 v0, 0x41200000    # 10.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setFadingEdgeLength(I)V

    .line 108
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setMarqueeRepeatLimit(I)V

    .line 109
    return-void
.end method

.method private setTitleMarquee()V
    .locals 4

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    .line 101
    :goto_0
    return-void

    .line 73
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/VKFragmentActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/VKFragmentActivity;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$setTitleMarquee$0()V
    .locals 7

    .prologue
    .line 75
    :try_start_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    const-string/jumbo v4, "action_bar_title"

    const-string/jumbo v5, "id"

    const-string/jumbo v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 77
    .local v0, "btnId":I
    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/VKFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-direct {p0, v3}, Lcom/vkontakte/android/VKFragmentActivity;->setTextViewMarquee(Landroid/widget/TextView;)V

    .line 80
    :cond_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    const-string/jumbo v4, "action_bar_subtitle"

    const-string/jumbo v5, "id"

    const-string/jumbo v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 82
    if-eqz v0, :cond_1

    .line 83
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/VKFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-direct {p0, v3}, Lcom/vkontakte/android/VKFragmentActivity;->setTextViewMarquee(Landroid/widget/TextView;)V

    .line 85
    :cond_1
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x11

    if-ge v3, v4, :cond_2

    .line 86
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v3

    const-string/jumbo v4, "action_bar"

    const-string/jumbo v5, "id"

    const-string/jumbo v6, "android"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 88
    if-eqz v0, :cond_2

    .line 89
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/VKFragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    .line 90
    .local v2, "vg":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 91
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v3, v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_3

    .line 92
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .end local v0    # "btnId":I
    .end local v1    # "i":I
    .end local v2    # "vg":Landroid/view/ViewGroup;
    :cond_2
    :goto_1
    return-void

    .line 90
    .restart local v0    # "btnId":I
    .restart local v1    # "i":I
    .restart local v2    # "vg":Landroid/view/ViewGroup;
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    .end local v0    # "btnId":I
    .end local v1    # "i":I
    .end local v2    # "vg":Landroid/view/ViewGroup;
    :catch_0
    move-exception v3

    goto :goto_1
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "cfg"    # Landroid/content/res/Configuration;

    .prologue
    .line 55
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 56
    invoke-direct {p0}, Lcom/vkontakte/android/VKFragmentActivity;->setTitleMarquee()V

    .line 57
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 21
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    .line 22
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/VKFragmentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 23
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const v1, 0x7f0203d2

    invoke-virtual {v0, v1}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 25
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->isTaskRoot()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 26
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 28
    :cond_0
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vkontakte/android/VKFragmentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 33
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onDestroy()V

    .line 34
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 37
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 38
    invoke-virtual {p0}, Lcom/vkontakte/android/VKFragmentActivity;->onBackPressed()V

    .line 39
    const/4 v0, 0x1

    .line 41
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 45
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onPause()V

    .line 46
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 47
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 50
    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    .line 51
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 52
    return-void
.end method

.method public setTitle(I)V
    .locals 0
    .param p1, "res"    # I

    .prologue
    .line 65
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->setTitle(I)V

    .line 66
    invoke-direct {p0}, Lcom/vkontakte/android/VKFragmentActivity;->setTitleMarquee()V

    .line 67
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/CharSequence;

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->setTitle(Ljava/lang/CharSequence;)V

    .line 61
    invoke-direct {p0}, Lcom/vkontakte/android/VKFragmentActivity;->setTitleMarquee()V

    .line 62
    return-void
.end method
