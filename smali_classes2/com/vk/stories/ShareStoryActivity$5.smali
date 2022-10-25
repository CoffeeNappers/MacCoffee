.class Lcom/vk/stories/ShareStoryActivity$5;
.super Ljava/lang/Object;
.source "ShareStoryActivity.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/ShareStoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 140
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 4
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 149
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v0, 0x1

    .line 150
    .local v0, "ns":Z
    :goto_0
    if-eqz v0, :cond_1

    .line 151
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$100(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v1

    const v2, 0x7f08045d

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 152
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$300(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$200(Lcom/vk/stories/ShareStoryActivity;)Lcom/vkontakte/android/fragments/friends/SearchIndexer;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/friends/SearchIndexer;->search(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->setData(Ljava/util/ArrayList;)V

    .line 157
    :goto_1
    return-void

    .line 149
    .end local v0    # "ns":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 154
    .restart local v0    # "ns":Z
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$100(Lcom/vk/stories/ShareStoryActivity;)Landroid/widget/TextView;

    move-result-object v1

    const v2, 0x7f08043f

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 155
    iget-object v1, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/ShareStoryActivity;->access$300(Lcom/vk/stories/ShareStoryActivity;)Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vk/stories/ShareStoryActivity$5;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/ShareStoryActivity;->access$400(Lcom/vk/stories/ShareStoryActivity;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/stories/ShareStoryActivity$ShareUsersAdapter;->setData(Ljava/util/ArrayList;)V

    goto :goto_1
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 142
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 145
    return-void
.end method
