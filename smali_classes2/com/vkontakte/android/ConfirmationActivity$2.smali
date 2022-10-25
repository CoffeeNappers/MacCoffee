.class Lcom/vkontakte/android/ConfirmationActivity$2;
.super Ljava/lang/Object;
.source "ConfirmationActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ConfirmationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ConfirmationActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ConfirmationActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ConfirmationActivity;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vkontakte/android/ConfirmationActivity$2;->this$0:Lcom/vkontakte/android/ConfirmationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;
    .param p2, "i"    # I

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/ConfirmationActivity;->result:Z

    .line 32
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/ConfirmationActivity;->ready:Z

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ConfirmationActivity$2;->this$0:Lcom/vkontakte/android/ConfirmationActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ConfirmationActivity;->finish()V

    .line 34
    return-void
.end method
