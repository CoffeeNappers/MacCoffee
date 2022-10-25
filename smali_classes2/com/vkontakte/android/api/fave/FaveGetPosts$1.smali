.class Lcom/vkontakte/android/api/fave/FaveGetPosts$1;
.super Lcom/vkontakte/android/data/Parser;
.source "FaveGetPosts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/fave/FaveGetPosts;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/fave/FaveGetPosts;

.field final synthetic val$f:Landroid/util/SparseBooleanArray;

.field final synthetic val$names:Landroid/util/SparseArray;

.field final synthetic val$photos:Landroid/util/SparseArray;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/fave/FaveGetPosts;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/fave/FaveGetPosts;

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->this$0:Lcom/vkontakte/android/api/fave/FaveGetPosts;

    iput-object p2, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$names:Landroid/util/SparseArray;

    iput-object p3, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$photos:Landroid/util/SparseArray;

    iput-object p4, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$f:Landroid/util/SparseBooleanArray;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$names:Landroid/util/SparseArray;

    iget-object v4, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$photos:Landroid/util/SparseArray;

    iget-object v5, p0, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->val$f:Landroid/util/SparseBooleanArray;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/NewsEntry;-><init>(Lorg/json/JSONObject;Ljava/lang/String;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseBooleanArray;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/fave/FaveGetPosts$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    return-object v0
.end method
