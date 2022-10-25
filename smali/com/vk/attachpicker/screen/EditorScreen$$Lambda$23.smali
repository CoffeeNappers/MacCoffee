.class final synthetic Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vk/attachpicker/imageeditor/FilterProducer;


# instance fields
.field private final arg$1:Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;->arg$1:Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)Lcom/vk/attachpicker/imageeditor/FilterProducer;
    .locals 1

    new-instance v0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;-><init>(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)V

    return-object v0
.end method


# virtual methods
.method public getFilter()Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/attachpicker/screen/EditorScreen$$Lambda$23;->arg$1:Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    invoke-static {v0}, Lcom/vk/attachpicker/screen/EditorScreen;->lambda$updateFilter$22(Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;)Lcom/vk/attachpicker/imageeditor/filter/AllInOneFilter;

    move-result-object v0

    return-object v0
.end method
