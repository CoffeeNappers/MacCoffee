.class Lcom/vkontakte/android/fragments/VKAlertFragment$1;
.super Ljava/lang/Object;
.source "VKAlertFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/VKAlertFragment;->init(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/VKAlertFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/VKAlertFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/VKAlertFragment;

    .prologue
    .line 47
    iput-object p1, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$1;->this$0:Lcom/vkontakte/android/fragments/VKAlertFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/fragments/VKAlertFragment$1;->this$0:Lcom/vkontakte/android/fragments/VKAlertFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/VKAlertFragment;->action()V

    .line 51
    return-void
.end method
