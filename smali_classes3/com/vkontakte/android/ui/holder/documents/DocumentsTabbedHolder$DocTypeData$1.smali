.class Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData$1;
.super Lcom/vkontakte/android/api/docs/DocTypesLoader;
.source "DocumentsTabbedHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;->getDocsAdapter(Landroid/content/Context;)Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;Ljava/util/ArrayList;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;
    .param p3, "typeId"    # I
    .param p4, "ownerId"    # I

    .prologue
    .line 54
    .local p2, "documents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData$1;->this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    invoke-direct {p0, p2, p3, p4}, Lcom/vkontakte/android/api/docs/DocTypesLoader;-><init>(Ljava/util/ArrayList;II)V

    return-void
.end method


# virtual methods
.method public onLoadedNextPage(Ljava/util/ArrayList;Z)V
    .locals 2
    .param p2, "canLoadMore"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;Z)V"
        }
    .end annotation

    .prologue
    .line 57
    .local p1, "allData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData$1;->this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;->docsAdapter:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData$1;->this$0:Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;

    iput-object p1, v1, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocTypeData;->documents:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/ui/holder/documents/DocumentsTabbedHolder$DocumentsAdapter;->setData(Ljava/util/ArrayList;Z)V

    .line 58
    return-void
.end method
