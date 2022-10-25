.class Lcom/vkontakte/android/activities/SignupActivity$1;
.super Lcom/vkontakte/android/ui/ActionBarProgressDrawable;
.source "SignupActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/activities/SignupActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/activities/SignupActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/activities/SignupActivity;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/activities/SignupActivity;
    .param p2, "drawable"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/vkontakte/android/activities/SignupActivity$1;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public invalidateSelf()V
    .locals 2

    .prologue
    .line 99
    invoke-super {p0}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->invalidateSelf()V

    .line 100
    iget-object v1, p0, Lcom/vkontakte/android/activities/SignupActivity$1;->this$0:Lcom/vkontakte/android/activities/SignupActivity;

    invoke-static {v1}, Lcom/vkontakte/android/ui/ActionBarHacks;->getActionBar(Landroid/app/Activity;)Landroid/view/View;

    move-result-object v0

    .line 101
    .local v0, "abv":Landroid/view/View;
    if-eqz v0, :cond_0

    .line 102
    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 104
    :cond_0
    return-void
.end method
