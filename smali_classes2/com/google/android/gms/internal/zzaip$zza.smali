.class Lcom/google/android/gms/internal/zzaip$zza;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzaip;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "zza"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/gms/internal/zzaip$zza$zza;,
        Lcom/google/android/gms/internal/zzaip$zza$zzb;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Ljava/lang/Object;",
        "B:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final bat:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<TA;>;"
        }
    .end annotation
.end field

.field private final bau:Lcom/google/android/gms/internal/zzaih$zza$zza;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaih$zza$zza",
            "<TA;TB;>;"
        }
    .end annotation
.end field

.field private bav:Lcom/google/android/gms/internal/zzaio;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaio",
            "<TA;TC;>;"
        }
    .end annotation
.end field

.field private baw:Lcom/google/android/gms/internal/zzaio;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzaio",
            "<TA;TC;>;"
        }
    .end annotation
.end field

.field private final values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<TB;TC;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaih$zza$zza;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<TA;>;",
            "Ljava/util/Map",
            "<TB;TC;>;",
            "Lcom/google/android/gms/internal/zzaih$zza$zza",
            "<TA;TB;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/gms/internal/zzaip$zza;->bat:Ljava/util/List;

    iput-object p2, p0, Lcom/google/android/gms/internal/zzaip$zza;->values:Ljava/util/Map;

    iput-object p3, p0, Lcom/google/android/gms/internal/zzaip$zza;->bau:Lcom/google/android/gms/internal/zzaih$zza$zza;

    return-void
.end method

.method private zza(Lcom/google/android/gms/internal/zzaim$zza;II)V
    .locals 5

    const/4 v4, 0x0

    add-int/lit8 v0, p3, 0x1

    add-int/lit8 v1, p2, -0x1

    invoke-direct {p0, v0, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zzab(II)Lcom/google/android/gms/internal/zzaim;

    move-result-object v1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->bat:Ljava/util/List;

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    sget-object v0, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    if-ne p1, v0, :cond_0

    new-instance v0, Lcom/google/android/gms/internal/zzain;

    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/zzaip$zza;->zzbp(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/google/android/gms/internal/zzain;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    :goto_0
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaip$zza;->bav:Lcom/google/android/gms/internal/zzaio;

    if-nez v1, :cond_1

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->bav:Lcom/google/android/gms/internal/zzaio;

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->baw:Lcom/google/android/gms/internal/zzaio;

    :goto_1
    return-void

    :cond_0
    new-instance v0, Lcom/google/android/gms/internal/zzaik;

    invoke-direct {p0, v2}, Lcom/google/android/gms/internal/zzaip$zza;->zzbp(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-direct {v0, v2, v3, v4, v1}, Lcom/google/android/gms/internal/zzaik;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/google/android/gms/internal/zzaip$zza;->baw:Lcom/google/android/gms/internal/zzaio;

    invoke-virtual {v1, v0}, Lcom/google/android/gms/internal/zzaio;->zzb(Lcom/google/android/gms/internal/zzaim;)V

    iput-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->baw:Lcom/google/android/gms/internal/zzaio;

    goto :goto_1
.end method

.method private zzab(II)Lcom/google/android/gms/internal/zzaim;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/android/gms/internal/zzaim",
            "<TA;TC;>;"
        }
    .end annotation

    const/4 v3, 0x0

    if-nez p2, :cond_0

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    if-ne p2, v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->bat:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzaik;

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zzbp(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v0, v1, v2, v3, v3}, Lcom/google/android/gms/internal/zzaik;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    goto :goto_0

    :cond_1
    div-int/lit8 v0, p2, 0x2

    add-int v1, p1, v0

    invoke-direct {p0, p1, v0}, Lcom/google/android/gms/internal/zzaip$zza;->zzab(II)Lcom/google/android/gms/internal/zzaim;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-direct {p0, v3, v0}, Lcom/google/android/gms/internal/zzaip$zza;->zzab(II)Lcom/google/android/gms/internal/zzaim;

    move-result-object v3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->bat:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    new-instance v0, Lcom/google/android/gms/internal/zzaik;

    invoke-direct {p0, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zzbp(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    invoke-direct {v0, v1, v4, v2, v3}, Lcom/google/android/gms/internal/zzaik;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/android/gms/internal/zzaim;Lcom/google/android/gms/internal/zzaim;)V

    goto :goto_0
.end method

.method private zzbp(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TA;)TC;"
        }
    .end annotation

    iget-object v0, p0, Lcom/google/android/gms/internal/zzaip$zza;->values:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/android/gms/internal/zzaip$zza;->bau:Lcom/google/android/gms/internal/zzaih$zza$zza;

    invoke-interface {v1, p1}, Lcom/google/android/gms/internal/zzaih$zza$zza;->zzbk(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static zzc(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaih$zza$zza;Ljava/util/Comparator;)Lcom/google/android/gms/internal/zzaip;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<A:",
            "Ljava/lang/Object;",
            "B:",
            "Ljava/lang/Object;",
            "C:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/List",
            "<TA;>;",
            "Ljava/util/Map",
            "<TB;TC;>;",
            "Lcom/google/android/gms/internal/zzaih$zza$zza",
            "<TA;TB;>;",
            "Ljava/util/Comparator",
            "<TA;>;)",
            "Lcom/google/android/gms/internal/zzaip",
            "<TA;TC;>;"
        }
    .end annotation

    new-instance v2, Lcom/google/android/gms/internal/zzaip$zza;

    invoke-direct {v2, p0, p1, p2}, Lcom/google/android/gms/internal/zzaip$zza;-><init>(Ljava/util/List;Ljava/util/Map;Lcom/google/android/gms/internal/zzaih$zza$zza;)V

    invoke-static {p0, p3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    new-instance v0, Lcom/google/android/gms/internal/zzaip$zza$zza;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/android/gms/internal/zzaip$zza$zza;-><init>(I)V

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzaip$zza$zza;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;

    iget v4, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    sub-int/2addr v1, v4

    iget-boolean v4, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baz:Z

    if-eqz v4, :cond_0

    sget-object v4, Lcom/google/android/gms/internal/zzaim$zza;->ban:Lcom/google/android/gms/internal/zzaim$zza;

    iget v0, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    invoke-direct {v2, v4, v0, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zza(Lcom/google/android/gms/internal/zzaim$zza;II)V

    move v0, v1

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_0
    sget-object v4, Lcom/google/android/gms/internal/zzaim$zza;->ban:Lcom/google/android/gms/internal/zzaim$zza;

    iget v5, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    invoke-direct {v2, v4, v5, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zza(Lcom/google/android/gms/internal/zzaim$zza;II)V

    iget v4, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    sub-int/2addr v1, v4

    sget-object v4, Lcom/google/android/gms/internal/zzaim$zza;->bam:Lcom/google/android/gms/internal/zzaim$zza;

    iget v0, v0, Lcom/google/android/gms/internal/zzaip$zza$zzb;->baA:I

    invoke-direct {v2, v4, v0, v1}, Lcom/google/android/gms/internal/zzaip$zza;->zza(Lcom/google/android/gms/internal/zzaim$zza;II)V

    move v0, v1

    goto :goto_1

    :cond_1
    new-instance v1, Lcom/google/android/gms/internal/zzaip;

    iget-object v0, v2, Lcom/google/android/gms/internal/zzaip$zza;->bav:Lcom/google/android/gms/internal/zzaio;

    if-nez v0, :cond_2

    invoke-static {}, Lcom/google/android/gms/internal/zzail;->zzcrr()Lcom/google/android/gms/internal/zzail;

    move-result-object v0

    :goto_2
    const/4 v2, 0x0

    invoke-direct {v1, v0, p3, v2}, Lcom/google/android/gms/internal/zzaip;-><init>(Lcom/google/android/gms/internal/zzaim;Ljava/util/Comparator;Lcom/google/android/gms/internal/zzaip$1;)V

    return-object v1

    :cond_2
    iget-object v0, v2, Lcom/google/android/gms/internal/zzaip$zza;->bav:Lcom/google/android/gms/internal/zzaio;

    goto :goto_2
.end method
