.class Lcom/vkontakte/android/VKActivity$2;
.super Ljava/lang/Object;
.source "VKActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKActivity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/VKActivity;

.field final synthetic val$toolbar:Landroid/support/v7/widget/Toolbar;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKActivity;Landroid/support/v7/widget/Toolbar;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/VKActivity;

    .prologue
    .line 206
    iput-object p1, p0, Lcom/vkontakte/android/VKActivity$2;->this$0:Lcom/vkontakte/android/VKActivity;

    iput-object p2, p0, Lcom/vkontakte/android/VKActivity$2;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 209
    iget-object v2, p0, Lcom/vkontakte/android/VKActivity$2;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2}, Landroid/support/v7/widget/Toolbar;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 211
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/VKActivity$2;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string/jumbo v3, "mTitleTextView"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 212
    .local v0, "f":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 213
    iget-object v2, p0, Lcom/vkontakte/android/VKActivity$2;->val$toolbar:Landroid/support/v7/widget/Toolbar;

    invoke-virtual {v0, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 214
    .local v1, "view":Landroid/widget/TextView;
    if-eqz v1, :cond_0

    .line 215
    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .end local v0    # "f":Ljava/lang/reflect/Field;
    .end local v1    # "view":Landroid/widget/TextView;
    :cond_0
    :goto_0
    return v4

    .line 218
    :catch_0
    move-exception v2

    goto :goto_0

    .line 217
    :catch_1
    move-exception v2

    goto :goto_0
.end method
