.class public Lcom/vk/attachpicker/PhotoEditorActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "PhotoEditorActivity.java"

# interfaces
.implements Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;
.implements Lcom/vk/attachpicker/AttachResulter;


# instance fields
.field private screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

.field private thumb:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public final $(I)Landroid/view/View;
    .locals 1
    .param p1, "id"    # I
        .annotation build Landroid/support/annotation/IdRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/PhotoEditorActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method synthetic lambda$onCreate$0(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {p1}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/core/simplescreen/ScreenContainer;->onTopPaddingChanged(I)V

    .line 39
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/ScreenContainer;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 71
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onBackPressed()V

    .line 73
    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 6
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 25
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 26
    invoke-static {p0}, Lcom/vk/core/util/KeyboardUtils;->setSoftInputModeNothing(Landroid/app/Activity;)V

    .line 27
    invoke-static {p0}, Lcom/vk/attachpicker/Picker;->init(Landroid/app/Activity;)V

    .line 29
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "force_thumb"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->thumb:Z

    .line 31
    const v2, 0x7f0301a5

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/PhotoEditorActivity;->setContentView(I)V

    .line 33
    const v2, 0x7f100487

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/PhotoEditorActivity;->$(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/core/simplescreen/ScreenContainer;

    iput-object v2, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    .line 34
    iget-object v2, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v2, p0}, Lcom/vk/core/simplescreen/ScreenContainer;->setOnDismissListener(Lcom/vk/core/simplescreen/ScreenContainer$OnDismissListener;)V

    .line 36
    const v2, 0x7f100488

    invoke-virtual {p0, v2}, Lcom/vk/attachpicker/PhotoEditorActivity;->$(I)Landroid/view/View;

    move-result-object v1

    .line 37
    .local v1, "view":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-static {p0, v1}, Lcom/vk/attachpicker/PhotoEditorActivity$$Lambda$1;->lambdaFactory$(Lcom/vk/attachpicker/PhotoEditorActivity;Landroid/view/View;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 41
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoEditorActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "file"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    .line 42
    .local v0, "file":Ljava/io/File;
    if-nez v0, :cond_0

    .line 43
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoEditorActivity;->finish()V

    .line 47
    :goto_0
    return-void

    .line 45
    :cond_0
    iget-object v2, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    new-instance v3, Lcom/vk/attachpicker/screen/EditorScreen;

    const/4 v4, 0x0

    iget-boolean v5, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->thumb:Z

    invoke-direct {v3, v0, v4, v5}, Lcom/vk/attachpicker/screen/EditorScreen;-><init>(Ljava/io/File;Lcom/vk/attachpicker/screen/EditorScreen$Delegate;Z)V

    invoke-virtual {v2, v3}, Lcom/vk/core/simplescreen/ScreenContainer;->showScreen(Lcom/vk/core/simplescreen/BaseScreen;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 63
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 64
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/ScreenContainer;->onDestroy()V

    .line 65
    return-void
.end method

.method public onDismiss()V
    .locals 0

    .prologue
    .line 77
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 78
    return-void
.end method

.method public onPause()V
    .locals 1

    .prologue
    .line 57
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 58
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/ScreenContainer;->onPause()V

    .line 59
    return-void
.end method

.method public onResume()V
    .locals 1

    .prologue
    .line 51
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 52
    iget-object v0, p0, Lcom/vk/attachpicker/PhotoEditorActivity;->screenContainer:Lcom/vk/core/simplescreen/ScreenContainer;

    invoke-virtual {v0}, Lcom/vk/core/simplescreen/ScreenContainer;->onResume()V

    .line 53
    return-void
.end method

.method public setResultAndFinish(Landroid/content/Intent;)V
    .locals 1
    .param p1, "result"    # Landroid/content/Intent;

    .prologue
    .line 82
    if-nez p1, :cond_0

    .line 83
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/PhotoEditorActivity;->setResult(I)V

    .line 84
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoEditorActivity;->finish()V

    .line 89
    :goto_0
    return-void

    .line 86
    :cond_0
    const/4 v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/vk/attachpicker/PhotoEditorActivity;->setResult(ILandroid/content/Intent;)V

    .line 87
    invoke-virtual {p0}, Lcom/vk/attachpicker/PhotoEditorActivity;->finish()V

    goto :goto_0
.end method
