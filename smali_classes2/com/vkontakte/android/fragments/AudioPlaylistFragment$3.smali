.class Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;
.super Ljava/lang/Object;
.source "AudioPlaylistFragment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AudioPlaylistFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

.field final synthetic val$toolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioPlaylistFragment;Landroid/support/v7/widget/Toolbar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    .prologue
    .line 178
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;->this$0:Lcom/vkontakte/android/fragments/AudioPlaylistFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 181
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v3}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    invoke-virtual {v3, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 183
    :try_start_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string/jumbo v4, "mTitleTextView"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 184
    .local v1, "f":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 185
    iget-object v3, p0, Lcom/vkontakte/android/fragments/AudioPlaylistFragment$3;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 186
    .local v2, "view":Landroid/widget/TextView;
    if-eqz v2, :cond_0

    .line 187
    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 192
    .end local v1    # "f":Ljava/lang/reflect/Field;
    .end local v2    # "view":Landroid/widget/TextView;
    :cond_0
    :goto_0
    return v5

    .line 189
    :catch_0
    move-exception v0

    .line 190
    .local v0, "e":Ljava/lang/Exception;
    new-array v3, v5, [Ljava/lang/Object;

    invoke-static {v0, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
