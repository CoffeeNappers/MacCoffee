.class Lcom/vkontakte/android/fragments/PostViewFragment$18;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->editRepostComment(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$edit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/widget/EditText;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1192
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$18;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$18;->val$edit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1195
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$18;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$18;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2200(Lcom/vkontakte/android/fragments/PostViewFragment;Ljava/lang/String;)V

    .line 1196
    return-void
.end method
