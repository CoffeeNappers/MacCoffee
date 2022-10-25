.class Lcom/vkontakte/android/fragments/AudioListFragment$2;
.super Ljava/lang/Object;
.source "AudioListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/AudioListFragment;->onAttach(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/AudioListFragment;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$400(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V

    .line 143
    return-void
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$300(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$2;->this$0:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$300(Lcom/vkontakte/android/fragments/AudioListFragment;Ljava/lang/String;)V

    .line 138
    return-void
.end method
