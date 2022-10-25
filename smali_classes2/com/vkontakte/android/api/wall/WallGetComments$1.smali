.class Lcom/vkontakte/android/api/wall/WallGetComments$1;
.super Lcom/vkontakte/android/data/Parser;
.source "WallGetComments.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/wall/WallGetComments;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/wall/WallGetComments$Result;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/NewsComment;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/wall/WallGetComments;

.field final synthetic val$names:Landroid/util/SparseArray;

.field final synthetic val$names_dat:Landroid/util/SparseArray;

.field final synthetic val$photos:Landroid/util/SparseArray;

.field final synthetic val$verifiedList:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/wall/WallGetComments;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/wall/WallGetComments;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->this$0:Lcom/vkontakte/android/api/wall/WallGetComments;

    iput-object p2, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$names:Landroid/util/SparseArray;

    iput-object p3, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$photos:Landroid/util/SparseArray;

    iput-object p4, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$names_dat:Landroid/util/SparseArray;

    iput-object p5, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$verifiedList:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsComment;
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 136
    new-instance v0, Lcom/vkontakte/android/NewsComment;

    iget-object v2, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$names:Landroid/util/SparseArray;

    iget-object v3, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$photos:Landroid/util/SparseArray;

    iget-object v4, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$names_dat:Landroid/util/SparseArray;

    iget-object v5, p0, Lcom/vkontakte/android/api/wall/WallGetComments$1;->val$verifiedList:Ljava/util/ArrayList;

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/NewsComment;-><init>(Lorg/json/JSONObject;Landroid/util/SparseArray;Landroid/util/SparseArray;Landroid/util/SparseArray;Ljava/util/ArrayList;)V

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
    .line 133
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/wall/WallGetComments$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/NewsComment;

    move-result-object v0

    return-object v0
.end method
