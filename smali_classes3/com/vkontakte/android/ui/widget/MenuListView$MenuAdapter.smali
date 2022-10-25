.class Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "MenuListView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MenuAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# static fields
.field private static final ITEM_TYPE_BIRTHDAY:I = 0x6

.field private static final ITEM_TYPE_DIVIDER:I = 0x7

.field private static final ITEM_TYPE_HEADER:I = 0x1

.field private static final ITEM_TYPE_ITEM:I = 0x2

.field private static final ITEM_TYPE_PADDING:I = 0x5

.field private static final ITEM_TYPE_SECTION:I = 0x4

.field private static final ITEM_TYPE_USER:I = 0x3


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 1

    .prologue
    .line 753
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 754
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->setHasStableIds(Z)V

    .line 755
    return-void
.end method


# virtual methods
.method public getImageCountForItem(I)I
    .locals 3
    .param p1, "position"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 907
    if-nez p1, :cond_1

    .line 948
    :cond_0
    :goto_0
    return v0

    .line 910
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 911
    if-nez p1, :cond_2

    move v0, v1

    .line 912
    goto :goto_0

    .line 914
    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 915
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_3

    move v0, v1

    .line 916
    goto :goto_0

    .line 918
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p1, v2

    .line 919
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_6

    .line 920
    if-nez p1, :cond_4

    move v0, v1

    .line 921
    goto :goto_0

    .line 923
    :cond_4
    if-ne p1, v0, :cond_5

    .line 924
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    .line 926
    :cond_5
    add-int/lit8 p1, p1, -0x2

    .line 928
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_8

    .line 929
    if-nez p1, :cond_7

    move v0, v1

    .line 930
    goto :goto_0

    .line 932
    :cond_7
    add-int/lit8 p1, p1, -0x1

    .line 933
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    .line 936
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p1, v2

    .line 938
    :cond_8
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_a

    .line 939
    if-nez p1, :cond_9

    move v0, v1

    .line 940
    goto :goto_0

    .line 942
    :cond_9
    add-int/lit8 p1, p1, -0x1

    .line 943
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lt p1, v2, :cond_0

    .line 946
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    :cond_a
    move v0, v1

    .line 948
    goto/16 :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    const/4 v0, 0x0

    .line 953
    if-nez p1, :cond_1

    .line 954
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$200(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v0

    .line 994
    :cond_0
    :goto_0
    return-object v0

    .line 956
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 957
    if-eqz p1, :cond_0

    .line 960
    add-int/lit8 p1, p1, -0x1

    .line 961
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_0

    .line 964
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr p1, v1

    .line 965
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 966
    if-eqz p1, :cond_0

    .line 969
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 970
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 972
    :cond_2
    add-int/lit8 p1, p1, -0x2

    .line 974
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5

    .line 975
    if-eqz p1, :cond_0

    .line 978
    add-int/lit8 p1, p1, -0x1

    .line 979
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_4

    .line 980
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0

    .line 982
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr p1, v1

    .line 984
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 985
    if-eqz p1, :cond_0

    .line 988
    add-int/lit8 p1, p1, -0x1

    .line 989
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge p1, v1, :cond_6

    .line 990
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    iget-object v0, v0, Lcom/vkontakte/android/api/Group;->photo:Ljava/lang/String;

    goto/16 :goto_0

    .line 992
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    sub-int/2addr p1, v1

    goto/16 :goto_0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 842
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v0, v1, 0x2

    .line 843
    .local v0, "count":I
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 844
    add-int/lit8 v0, v0, 0x2

    .line 846
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 847
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    .line 849
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 850
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    .line 852
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 853
    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 999
    if-nez p1, :cond_0

    .line 1000
    const-wide/32 v0, -0x77359401

    .line 1041
    :goto_0
    return-wide v0

    .line 1002
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 1003
    if-nez p1, :cond_1

    .line 1005
    const-wide/32 v0, -0x77359402

    goto :goto_0

    .line 1007
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 1008
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_2

    .line 1009
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    iget v0, v0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    const v1, 0x77359400

    add-int/2addr v0, v1

    int-to-long v0, v0

    goto :goto_0

    .line 1011
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    .line 1012
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 1013
    if-nez p1, :cond_3

    .line 1014
    const-wide/32 v0, -0x77359403

    goto :goto_0

    .line 1016
    :cond_3
    const/4 v0, 0x1

    if-ne p1, v0, :cond_4

    .line 1017
    const-wide/32 v0, -0x77359404

    goto :goto_0

    .line 1019
    :cond_4
    add-int/lit8 p1, p1, -0x2

    .line 1021
    :cond_5
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_8

    .line 1022
    if-nez p1, :cond_6

    .line 1023
    const-wide/32 v0, -0x77359405

    goto :goto_0

    .line 1025
    :cond_6
    add-int/lit8 p1, p1, -0x1

    .line 1026
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_7

    .line 1027
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    int-to-long v0, v0

    goto :goto_0

    .line 1029
    :cond_7
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    .line 1031
    :cond_8
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_b

    .line 1032
    if-nez p1, :cond_9

    .line 1033
    const-wide/32 v0, -0x77359406

    goto/16 :goto_0

    .line 1035
    :cond_9
    add-int/lit8 p1, p1, -0x1

    .line 1036
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_a

    .line 1037
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    iget v0, v0, Lcom/vkontakte/android/api/Group;->id:I

    neg-int v0, v0

    int-to-long v0, v0

    goto/16 :goto_0

    .line 1039
    :cond_a
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    .line 1041
    :cond_b
    invoke-super {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    goto/16 :goto_0
.end method

.method public getItemViewType(I)I
    .locals 6
    .param p1, "position"    # I

    .prologue
    const/4 v1, 0x4

    const/4 v3, 0x3

    const/4 v2, 0x1

    const/4 v5, 0x0

    const/4 v0, 0x7

    .line 858
    if-nez p1, :cond_1

    move v0, v2

    .line 902
    :cond_0
    :goto_0
    return v0

    .line 861
    :cond_1
    add-int/lit8 p1, p1, -0x1

    .line 862
    if-nez p1, :cond_2

    .line 863
    const/4 v0, 0x5

    goto :goto_0

    .line 865
    :cond_2
    add-int/lit8 p1, p1, -0x1

    .line 866
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge p1, v4, :cond_3

    .line 867
    const/4 v0, 0x2

    goto :goto_0

    .line 869
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    sub-int/2addr p1, v4

    .line 870
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_5

    .line 871
    if-eqz p1, :cond_0

    .line 874
    if-ne p1, v2, :cond_4

    .line 875
    const/4 v0, 0x6

    goto :goto_0

    .line 877
    :cond_4
    add-int/lit8 p1, p1, -0x2

    .line 879
    :cond_5
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_8

    .line 880
    if-nez p1, :cond_6

    .line 881
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_0

    move v0, v1

    goto :goto_0

    .line 883
    :cond_6
    add-int/lit8 p1, p1, -0x1

    .line 884
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge p1, v2, :cond_7

    move v0, v3

    .line 885
    goto :goto_0

    .line 887
    :cond_7
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr p1, v2

    .line 889
    :cond_8
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_b

    .line 890
    if-nez p1, :cond_9

    .line 891
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    cmpl-float v2, v2, v5

    if-eqz v2, :cond_0

    move v0, v1

    goto/16 :goto_0

    .line 893
    :cond_9
    add-int/lit8 p1, p1, -0x1

    .line 894
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_a

    move v0, v3

    .line 895
    goto/16 :goto_0

    .line 897
    :cond_a
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p1, v0

    .line 899
    :cond_b
    if-nez p1, :cond_c

    .line 900
    const/4 v0, 0x5

    goto/16 :goto_0

    .line 902
    :cond_c
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 743
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 785
    if-nez p2, :cond_1

    .line 786
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->bind()V

    .line 838
    :cond_0
    :goto_0
    return-void

    .line 789
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_1
    add-int/lit8 p2, p2, -0x1

    .line 790
    if-eqz p2, :cond_0

    .line 794
    add-int/lit8 p2, p2, -0x1

    .line 795
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_2

    .line 796
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->bind(Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;)V

    goto :goto_0

    .line 799
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1500(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p2, v0

    .line 800
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1600(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_4

    .line 801
    if-eqz p2, :cond_0

    .line 804
    if-ne p2, v2, :cond_3

    .line 805
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;->bind()V

    goto :goto_0

    .line 808
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_3
    add-int/lit8 p2, p2, -0x2

    .line 810
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_7

    .line 811
    if-nez p2, :cond_5

    .line 812
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 813
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f08023b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->bind(Ljava/lang/String;I)V

    goto :goto_0

    .line 817
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_5
    add-int/lit8 p2, p2, -0x1

    .line 818
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_6

    .line 819
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->bind(Lcom/vkontakte/android/UserProfile;)V

    goto/16 :goto_0

    .line 822
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_6
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p2, v0

    .line 824
    :cond_7
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 825
    if-nez p2, :cond_8

    .line 826
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    .line 827
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0802fd

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;->bind(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 831
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_8
    add-int/lit8 p2, p2, -0x1

    .line 832
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_9

    .line 833
    check-cast p1, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;

    .end local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;->bind(Lcom/vkontakte/android/api/Group;)V

    goto/16 :goto_0

    .line 836
    .restart local p1    # "holder":Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    :cond_9
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$100(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr p2, v0

    goto/16 :goto_0
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 743
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 759
    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 760
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    .line 780
    :goto_0
    return-object v0

    .line 762
    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 763
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 765
    :cond_1
    const/4 v0, 0x4

    if-ne p2, v0, :cond_2

    .line 766
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$SectionViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 768
    :cond_2
    const/4 v0, 0x3

    if-ne p2, v0, :cond_3

    .line 769
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$UserViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 771
    :cond_3
    const/4 v0, 0x5

    if-ne p2, v0, :cond_4

    .line 772
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$PaddingViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$PaddingViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 774
    :cond_4
    const/4 v0, 0x6

    if-ne p2, v0, :cond_5

    .line 775
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$BirthdayViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 777
    :cond_5
    const/4 v0, 0x7

    if-ne p2, v0, :cond_6

    .line 778
    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$DividerViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$MenuAdapter;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$DividerViewHolder;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    goto :goto_0

    .line 780
    :cond_6
    const/4 v0, 0x0

    goto :goto_0
.end method
