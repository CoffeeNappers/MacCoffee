.class Lcom/vkontakte/android/fragments/ProfileFragment$3;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 290
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 293
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 294
    .local v0, "act":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$3;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$400(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V

    .line 295
    return-void
.end method
