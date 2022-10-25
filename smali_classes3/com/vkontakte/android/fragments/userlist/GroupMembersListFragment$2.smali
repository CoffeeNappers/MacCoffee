.class Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;
.super Lcom/vkontakte/android/api/SimpleListCallback;
.source "GroupMembersListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleListCallback",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    .prologue
    .line 132
    .local p2, "fragment":Lme/grishka/appkit/fragments/BaseRecyclerFragment;, "Lme/grishka/appkit/fragments/BaseRecyclerFragment<Lcom/vkontakte/android/UserProfile;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleListCallback;-><init>(Lme/grishka/appkit/fragments/BaseRecyclerFragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 135
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleListCallback;->success(Lcom/vkontakte/android/data/VKList;)V

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$100(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/ui/util/SectionSegmenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$000(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SectionSegmenter;->addItems(Ljava/util/List;)V

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$300(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/ui/util/SearchSegmenter;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$200(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->bind(Ljava/util/List;)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->this$0:Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;->access$400(Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyDataSetChanged()V

    .line 139
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 132
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/userlist/GroupMembersListFragment$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
