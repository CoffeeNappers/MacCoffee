.class public final Lcom/google/android/gms/internal/zzai$zzh;
.super Lcom/google/android/gms/internal/zzaru;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/gms/internal/zzai;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "zzh"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/android/gms/internal/zzaru",
        "<",
        "Lcom/google/android/gms/internal/zzai$zzh;",
        ">;"
    }
.end annotation


# static fields
.field public static final zzxi:Lcom/google/android/gms/internal/zzarv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/gms/internal/zzarv",
            "<",
            "Lcom/google/android/gms/internal/zzaj$zza;",
            "Lcom/google/android/gms/internal/zzai$zzh;",
            ">;"
        }
    .end annotation
.end field

.field private static final zzxj:[Lcom/google/android/gms/internal/zzai$zzh;


# instance fields
.field public zzxk:[I

.field public zzxl:[I

.field public zzxm:[I

.field public zzxn:I

.field public zzxo:[I

.field public zzxp:I

.field public zzxq:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0xb

    const-class v1, Lcom/google/android/gms/internal/zzai$zzh;

    const-wide/16 v2, 0x32a

    invoke-static {v0, v1, v2, v3}, Lcom/google/android/gms/internal/zzarv;->zza(ILjava/lang/Class;J)Lcom/google/android/gms/internal/zzarv;

    move-result-object v0

    sput-object v0, Lcom/google/android/gms/internal/zzai$zzh;->zzxi:Lcom/google/android/gms/internal/zzarv;

    const/4 v0, 0x0

    new-array v0, v0, [Lcom/google/android/gms/internal/zzai$zzh;

    sput-object v0, Lcom/google/android/gms/internal/zzai$zzh;->zzxj:[Lcom/google/android/gms/internal/zzai$zzh;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/android/gms/internal/zzaru;-><init>()V

    invoke-virtual {p0}, Lcom/google/android/gms/internal/zzai$zzh;->zzan()Lcom/google/android/gms/internal/zzai$zzh;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v0, 0x0

    if-ne p1, p0, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    instance-of v2, p1, Lcom/google/android/gms/internal/zzai$zzh;

    if-eqz v2, :cond_0

    check-cast p1, Lcom/google/android/gms/internal/zzai$zzh;

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    iget v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    iget-object v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzary;->equals([I[I)Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    iget v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    if-ne v2, v3, :cond_0

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    iget v3, p1, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p1, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v2, :cond_3

    iget-object v2, p1, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v2}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_3
    move v0, v1

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    iget-object v1, p1, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/zzarw;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    add-int/lit16 v0, v0, 0x20f

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzary;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzary;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzary;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget-object v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    invoke-static {v1}, Lcom/google/android/gms/internal/zzary;->hashCode([I)I

    move-result v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x1f

    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    add-int/2addr v0, v1

    mul-int/lit8 v1, v0, 0x1f

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzarw;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    invoke-virtual {v0}, Lcom/google/android/gms/internal/zzarw;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public zza(Lcom/google/android/gms/internal/zzart;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v0, v0

    if-lez v0, :cond_0

    move v0, v1

    :goto_0
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v2, v2

    if-ge v0, v2, :cond_0

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    aget v3, v3, v0

    invoke-virtual {p1, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v0, v0

    if-lez v0, :cond_1

    move v0, v1

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v2, v2

    if-ge v0, v2, :cond_1

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    aget v3, v3, v0

    invoke-virtual {p1, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v0, v0

    if-lez v0, :cond_2

    move v0, v1

    :goto_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v2, v2

    if-ge v0, v2, :cond_2

    const/4 v2, 0x3

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    aget v3, v3, v0

    invoke-virtual {p1, v2, v3}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    if-eqz v0, :cond_3

    const/4 v0, 0x4

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v0, v0

    if-lez v0, :cond_4

    :goto_3
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v0, v0

    if-ge v1, v0, :cond_4

    const/4 v0, 0x5

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    aget v2, v2, v1

    invoke-virtual {p1, v0, v2}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_4
    iget v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    if-eqz v0, :cond_5

    const/4 v0, 0x6

    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_5
    iget v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    if-eqz v0, :cond_6

    const/4 v0, 0x7

    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    invoke-virtual {p1, v0, v1}, Lcom/google/android/gms/internal/zzart;->zzaf(II)V

    :cond_6
    invoke-super {p0, p1}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzart;)V

    return-void
.end method

.method public zzan()Lcom/google/android/gms/internal/zzai$zzh;
    .locals 2

    const/4 v1, 0x0

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btR:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btR:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btR:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    iput v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    sget-object v0, Lcom/google/android/gms/internal/zzasd;->btR:[I

    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    iput v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    iput v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btG:Lcom/google/android/gms/internal/zzarw;

    const/4 v0, -0x1

    iput v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->btP:I

    return-object p0
.end method

.method public synthetic zzb(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzasa;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/google/android/gms/internal/zzai$zzh;->zzu(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzai$zzh;

    move-result-object v0

    return-object v0
.end method

.method public zzu(Lcom/google/android/gms/internal/zzars;)Lcom/google/android/gms/internal/zzai$zzh;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1, v0}, Lcom/google/android/gms/internal/zzaru;->zza(Lcom/google/android/gms/internal/zzars;I)Z

    move-result v0

    if-nez v0, :cond_0

    :sswitch_0
    return-object p0

    :sswitch_1
    const/16 v0, 0x8

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    if-nez v0, :cond_2

    move v0, v1

    :goto_1
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_1

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1
    :goto_2
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v0, v0

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    goto :goto_0

    :sswitch_2
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cd()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zzagt(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->getPosition()I

    move-result v2

    move v0, v1

    :goto_3
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ci()I

    move-result v4

    if-lez v4, :cond_4

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_4
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzars;->zzagv(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    if-nez v2, :cond_6

    move v2, v1

    :goto_4
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_5

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_5
    :goto_5
    array-length v4, v0

    if-ge v2, v4, :cond_7

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_6
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v2, v2

    goto :goto_4

    :cond_7
    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zzagu(I)V

    goto/16 :goto_0

    :sswitch_3
    const/16 v0, 0x10

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    if-nez v0, :cond_9

    move v0, v1

    :goto_6
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_8

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_8
    :goto_7
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_a

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    :cond_9
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v0, v0

    goto :goto_6

    :cond_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    goto/16 :goto_0

    :sswitch_4
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cd()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zzagt(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->getPosition()I

    move-result v2

    move v0, v1

    :goto_8
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ci()I

    move-result v4

    if-lez v4, :cond_b

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    :cond_b
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzars;->zzagv(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    if-nez v2, :cond_d

    move v2, v1

    :goto_9
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_c

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_c
    :goto_a
    array-length v4, v0

    if-ge v2, v4, :cond_e

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_d
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v2, v2

    goto :goto_9

    :cond_e
    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zzagu(I)V

    goto/16 :goto_0

    :sswitch_5
    const/16 v0, 0x18

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    if-nez v0, :cond_10

    move v0, v1

    :goto_b
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_f

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_f
    :goto_c
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_11

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    :cond_10
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v0, v0

    goto :goto_b

    :cond_11
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    goto/16 :goto_0

    :sswitch_6
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cd()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zzagt(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->getPosition()I

    move-result v2

    move v0, v1

    :goto_d
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ci()I

    move-result v4

    if-lez v4, :cond_12

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_12
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzars;->zzagv(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    if-nez v2, :cond_14

    move v2, v1

    :goto_e
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_13

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_13
    :goto_f
    array-length v4, v0

    if-ge v2, v4, :cond_15

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_14
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v2, v2

    goto :goto_e

    :cond_15
    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zzagu(I)V

    goto/16 :goto_0

    :sswitch_7
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    goto/16 :goto_0

    :sswitch_8
    const/16 v0, 0x28

    invoke-static {p1, v0}, Lcom/google/android/gms/internal/zzasd;->zzc(Lcom/google/android/gms/internal/zzars;I)I

    move-result v2

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    if-nez v0, :cond_17

    move v0, v1

    :goto_10
    add-int/2addr v2, v0

    new-array v2, v2, [I

    if-eqz v0, :cond_16

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_16
    :goto_11
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_18

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bU()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    :cond_17
    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v0, v0

    goto :goto_10

    :cond_18
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v3

    aput v3, v2, v0

    iput-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    goto/16 :goto_0

    :sswitch_9
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->cd()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/google/android/gms/internal/zzars;->zzagt(I)I

    move-result v3

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->getPosition()I

    move-result v2

    move v0, v1

    :goto_12
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->ci()I

    move-result v4

    if-lez v4, :cond_19

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    :cond_19
    invoke-virtual {p1, v2}, Lcom/google/android/gms/internal/zzars;->zzagv(I)V

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    if-nez v2, :cond_1b

    move v2, v1

    :goto_13
    add-int/2addr v0, v2

    new-array v0, v0, [I

    if-eqz v2, :cond_1a

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    invoke-static {v4, v1, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_1a
    :goto_14
    array-length v4, v0

    if-ge v2, v4, :cond_1c

    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v4

    aput v4, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_1b
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v2, v2

    goto :goto_13

    :cond_1c
    iput-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    invoke-virtual {p1, v3}, Lcom/google/android/gms/internal/zzars;->zzagu(I)V

    goto/16 :goto_0

    :sswitch_a
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    goto/16 :goto_0

    :sswitch_b
    invoke-virtual {p1}, Lcom/google/android/gms/internal/zzars;->bY()I

    move-result v0

    iput v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    goto/16 :goto_0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x8 -> :sswitch_1
        0xa -> :sswitch_2
        0x10 -> :sswitch_3
        0x12 -> :sswitch_4
        0x18 -> :sswitch_5
        0x1a -> :sswitch_6
        0x20 -> :sswitch_7
        0x28 -> :sswitch_8
        0x2a -> :sswitch_9
        0x30 -> :sswitch_a
        0x38 -> :sswitch_b
    .end sparse-switch
.end method

.method protected zzx()I
    .locals 5

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/google/android/gms/internal/zzaru;->zzx()I

    move-result v3

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v0, v0

    if-lez v0, :cond_a

    move v0, v1

    move v2, v1

    :goto_0
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v4, v4

    if-ge v0, v4, :cond_0

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    aget v4, v4, v0

    invoke-static {v4}, Lcom/google/android/gms/internal/zzart;->zzagz(I)I

    move-result v4

    add-int/2addr v2, v4

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    add-int v0, v3, v2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxk:[I

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    :goto_1
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v2, v2

    if-lez v2, :cond_2

    move v2, v1

    move v3, v1

    :goto_2
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v4, v4

    if-ge v2, v4, :cond_1

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    aget v4, v4, v2

    invoke-static {v4}, Lcom/google/android/gms/internal/zzart;->zzagz(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_1
    add-int/2addr v0, v3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxl:[I

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    :cond_2
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v2, v2

    if-lez v2, :cond_4

    move v2, v1

    move v3, v1

    :goto_3
    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v4, v4

    if-ge v2, v4, :cond_3

    iget-object v4, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    aget v4, v4, v2

    invoke-static {v4}, Lcom/google/android/gms/internal/zzart;->zzagz(I)I

    move-result v4

    add-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    :cond_3
    add-int/2addr v0, v3

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxm:[I

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x1

    add-int/2addr v0, v2

    :cond_4
    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    if-eqz v2, :cond_5

    const/4 v2, 0x4

    iget v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxn:I

    invoke-static {v2, v3}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v2

    add-int/2addr v0, v2

    :cond_5
    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v2, v2

    if-lez v2, :cond_7

    move v2, v1

    :goto_4
    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v3, v3

    if-ge v1, v3, :cond_6

    iget-object v3, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    aget v3, v3, v1

    invoke-static {v3}, Lcom/google/android/gms/internal/zzart;->zzagz(I)I

    move-result v3

    add-int/2addr v2, v3

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_6
    add-int/2addr v0, v2

    iget-object v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxo:[I

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x1

    add-int/2addr v0, v1

    :cond_7
    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    if-eqz v1, :cond_8

    const/4 v1, 0x6

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxp:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_8
    iget v1, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    if-eqz v1, :cond_9

    const/4 v1, 0x7

    iget v2, p0, Lcom/google/android/gms/internal/zzai$zzh;->zzxq:I

    invoke-static {v1, v2}, Lcom/google/android/gms/internal/zzart;->zzah(II)I

    move-result v1

    add-int/2addr v0, v1

    :cond_9
    return v0

    :cond_a
    move v0, v3

    goto/16 :goto_1
.end method
