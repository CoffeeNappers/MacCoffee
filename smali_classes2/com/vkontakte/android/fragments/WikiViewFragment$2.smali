.class Lcom/vkontakte/android/fragments/WikiViewFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "WikiViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/WikiViewFragment;->loadNote(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/pages/NotesGetById$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/WikiViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/WikiViewFragment;

    .prologue
    .line 217
    iput-object p1, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/pages/NotesGetById$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/pages/NotesGetById$Result;

    .prologue
    .line 220
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/pages/NotesGetById$Result;->url:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$400(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/String;)V

    .line 221
    iget-object v0, p0, Lcom/vkontakte/android/fragments/WikiViewFragment$2;->this$0:Lcom/vkontakte/android/fragments/WikiViewFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/pages/NotesGetById$Result;->title:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/WikiViewFragment;->access$600(Lcom/vkontakte/android/fragments/WikiViewFragment;Ljava/lang/CharSequence;)V

    .line 222
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 217
    check-cast p1, Lcom/vkontakte/android/api/pages/NotesGetById$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/WikiViewFragment$2;->success(Lcom/vkontakte/android/api/pages/NotesGetById$Result;)V

    return-void
.end method
