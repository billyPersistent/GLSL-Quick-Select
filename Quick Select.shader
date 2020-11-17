#define ARRAY_SIZE 6

void swap(inout float firstFloat, inout float secondFloat)
{
	float save = firstFloat;
	firstFloat = secondFloat;
	secondFloat = save;

	return;
}

int partition(inout float array[ARRAY_SIZE], int firstIndex, int lastIndex)
{
	float lastFloat = array[lastIndex];
	int pivotIndex = firstIndex;

	for (int i = firstIndex; i < lastIndex; i++)
	{
		if (array[i] <= lastFloat)
		{
			swap(array[pivotIndex], array[i]);
			pivotIndex++;
		}
	}

	swap(array[lastIndex], array[pivotIndex]);
	return pivotIndex;
}

float quickSelect(inout float array[ARRAY_SIZE], int k, int firstIndex, int lastIndex)
{
	while (firstIndex <= lastIndex)
	{
		int index = partition(array, firstIndex, lastIndex);

		if (index == k)
		{
			return array[index];
		}

		if (index > k)
		{
			lastIndex = index - 1;
		}
		else
		{
			firstIndex = index + 1;
		}
	}

	return -1.0;
}