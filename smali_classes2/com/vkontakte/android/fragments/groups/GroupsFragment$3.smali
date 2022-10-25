.class Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;
.super Ljava/lang/Thread;
.source "GroupsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groups/GroupsFragment;->doLoadData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

.field final synthetic val$when:J


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/GroupsFragment;J)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    iput-wide p2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->val$when:J

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method static synthetic lambda$null$1(Lcom/vkontakte/android/api/Group;Lcom/vkontakte/android/api/Group;)I
    .locals 2
    .param p0, "lhs"    # Lcom/vkontakte/android/api/Group;
    .param p1, "rhs"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 276
    iget v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    iget v1, p1, Lcom/vkontakte/android/api/Group;->startTime:I

    if-ge v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    iget v1, p1, Lcom/vkontakte/android/api/Group;->startTime:I

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method

.method static synthetic lambda$run$0(Lcom/vkontakte/android/api/Group;Lcom/vkontakte/android/api/Group;)I
    .locals 2
    .param p0, "lhs"    # Lcom/vkontakte/android/api/Group;
    .param p1, "rhs"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 274
    iget v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    iget v1, p1, Lcom/vkontakte/android/api/Group;->startTime:I

    if-ge v0, v1, :cond_0

    const/4 v0, -0x1

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/api/Group;->startTime:I

    iget v1, p1, Lcom/vkontakte/android/api/Group;->startTime:I

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$run$2()V
    .locals 3

    .prologue
    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3$$Lambda$3;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 277
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$900(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/EventsFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$800(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/groups/EventsFragment;->setData(Ljava/util/ArrayList;Z)V

    .line 278
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$300(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;->setData(Ljava/util/ArrayList;)V

    .line 279
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$100(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)V

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->dataLoaded()V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->invalidateOptionsMenu()V

    .line 282
    return-void
.end method

.method public run()V
    .locals 6

    .prologue
    .line 258
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 259
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$500(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 260
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->getAdminedGroups(Ljava/util/ArrayList;)V

    .line 264
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 265
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 266
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 267
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    .line 268
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    iget v2, v0, Lcom/vkontakte/android/api/Group;->type:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1

    .line 269
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 262
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    .end local v1    # "i":I
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$400(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/data/Groups;->getGroups(Ljava/util/ArrayList;)V

    goto :goto_0

    .line 271
    .restart local v0    # "g":Lcom/vkontakte/android/api/Group;
    .restart local v1    # "i":I
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$600(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 274
    .end local v0    # "g":Lcom/vkontakte/android/api/Group;
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->this$0:Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/groups/GroupsFragment;->access$700(Lcom/vkontakte/android/fragments/groups/GroupsFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3$$Lambda$1;->lambdaFactory$()Ljava/util/Comparator;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 275
    invoke-static {p0}, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;)Ljava/lang/Runnable;

    move-result-object v2

    iget-wide v4, p0, Lcom/vkontakte/android/fragments/groups/GroupsFragment$3;->val$when:J

    invoke-static {v2, v4, v5}, Lcom/vkontakte/android/functions/Functions;->postDelayed(Ljava/lang/Runnable;J)V

    .line 283
    return-void
.end method
